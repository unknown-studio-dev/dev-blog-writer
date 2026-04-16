# MCP Publishing Integration

This guide covers how to publish posts directly to platforms using MCP (Model Context Protocol) servers. The skill supports both automated publishing (when MCPs are available) and manual fallback (when they're not).

## Discovery workflow

Before attempting to publish, always check what's available:

### Step 1: Check for connected MCPs

Look for publishing-capable tools in the current session. The user may already have social media or blog MCPs connected. Check by attempting to list available tools or by looking at the MCP tools visible in the session.

### Step 2: Search the MCP registry

If no publishing MCPs are connected, use `search_mcp_registry` to find available options:

```
Search terms to try:
- ["social media", "publishing", "post"]
- ["facebook", "threads", "social"]
- ["medium", "blog", "publish"]
- ["substack", "newsletter"]
- ["devto", "hashnode", "ghost", "blog"]
- ["ayrshare"] (multi-platform publishing)
```

### Step 3: Suggest connectors

If relevant MCPs are found in the registry, use `suggest_connectors` to recommend them to the user. Explain what each connector enables.

### Step 4: Update config

After connecting MCPs, update the `publishing` section of `config.json`:
```json
{
  "publishing": {
    "mcp_available": true,
    "platforms_connected": ["facebook", "threads"],
    "mcp_provider": "ayrshare"
  }
}
```

## Recommended MCP providers

### Multi-platform (preferred)

**Ayrshare MCP** — Best for publishing to multiple platforms at once.
- Supports: Facebook, Threads, Instagram, Twitter/X, LinkedIn, TikTok, YouTube, Pinterest, Reddit, and more (13+ platforms)
- 75+ tools including scheduling, analytics, media management
- Handles platform-specific formatting transparently
- Search terms: `["ayrshare", "social media"]`

**BulkPublish MCP** — Code-first alternative designed for AI agents.
- Supports: Facebook, Threads, Instagram, X, TikTok, YouTube, LinkedIn, and more (11 platforms)
- Structured JSON responses optimized for LLM parsing
- Key tools: `create_post`, `list_channels`, `upload_media`, `get_analytics`
- Search terms: `["bulkpublish", "social media"]`

### Platform-specific

| Platform | MCP option | Notes |
|----------|-----------|-------|
| Facebook Pages | Composio Facebook MCP | Pages only, not groups |
| Threads | ThreadsMcpNet | Purpose-built for Threads |
| Medium | Via Ayrshare or Medium API | Medium's own API is archived but functional |
| Dev.to | Via Forem/Dev.to API | API key from Dev.to settings |
| Hashnode | Hashnode GraphQL API | Two-step: create draft → publish |
| Ghost | Ghost Admin API | JWT authentication required |
| Substack | No reliable API | Manual posting only |

## Platform publishing details

### Facebook Pages
- **API**: Facebook Graph API
- **Endpoint**: `POST /page_id/feed`
- **Auth**: Page access token with `pages_manage_metadata` permission
- **Content**: `message` (text), optional `link`, `picture`
- **Important**: Facebook deprecated third-party group posting in April 2024. Only Page publishing is automatable. For Groups, generate the content and the user must copy-paste manually.

### Threads
- **API**: Meta Threads API
- **Endpoint**: `POST /threads`
- **Auth**: User access token with `threads_basic` scope
- **Content**: `text` parameter (500 char limit per post)
- **For threads**: Create multiple posts linked as replies
- **Returns**: `thread_id`, `permalink_url`

### Medium
- **API**: Medium API v1 (archived but functional)
- **Endpoint**: `POST /users/{user_id}/posts`
- **Auth**: Integration token from Medium Settings
- **Content**: `title`, `contentFormat` ("markdown" or "html"), `content`, `tags`, `publishStatus`
- **Note**: Legacy API — works but not actively maintained

### Dev.to
- **API**: Forem API
- **Endpoint**: `POST /api/articles`
- **Auth**: API key via `api-key` header
- **Content**: `article.title`, `article.body_markdown`, `article.tags`, `article.published`
- **Supports**: YAML front matter, series grouping, canonical URLs

### Hashnode
- **API**: GraphQL at `https://gql.hashnode.com`
- **Auth**: Personal Access Token (PAT)
- **Two-step workflow**:
  1. `createDraft` mutation → returns `draft.id`
  2. `publishDraft` mutation with `draftId`
- **Content**: `title`, `contentMarkdown`, `publicationId`, tags as objects

### Ghost
- **API**: Ghost Admin API
- **Endpoint**: `POST /admin/posts/`
- **Auth**: JWT from integration token (`{id}:{secret}`)
- **Content**: `posts[0].title`, `posts[0].html`, `posts[0].status`, `posts[0].tags`

### Substack
- **No official API**. Substack does not support automated publishing.
- **Workaround**: Generate markdown content, user copy-pastes into Substack editor
- **Strategy**: Write the post in markdown with Substack formatting rules applied, then provide as a file

## Publishing workflow

When the user says "publish this" or "post this":

### 1. Content preparation
- Convert the draft to the target platform's format
- For Facebook/Threads: Strip markdown, use plain text with line breaks
- For Medium/Hashnode/Dev.to: Keep markdown
- For Ghost: Convert to HTML
- Apply platform-specific character limits and formatting rules

### 2. Pre-publish checklist
- Confirm target platform with user
- Show preview of how it will look
- Confirm publish status (draft vs published)
- For cross-posting: Set canonical URL to the original

### 3. Publish
If MCP is available:
- Call the appropriate MCP tool with formatted content
- Return the published URL to the user
- Log success in session

If MCP is NOT available:
- Save the formatted content as a file
- Provide platform-specific instructions for manual posting
- For Facebook Groups: Remind user that API posting is not available, provide copy-paste ready content

### 4. Cross-posting
When publishing to multiple platforms:
- Publish to the primary platform first (usually the blog)
- Use the primary URL as `canonical_url` for all cross-posts
- Adapt format for each platform (full post for blogs, teaser for social)
- Stagger social posts if possible (not all at once)

## Graceful fallback

When no publishing MCP is available, the skill should:

1. Generate platform-ready content as a downloadable file
2. Provide clear instructions for manual posting on each platform
3. Offer to search the MCP registry: "Want me to check if there's a publishing connector available?"
4. Never fail silently — always tell the user what happened and what they can do

## Facebook Groups workaround

Since Facebook Groups API is deprecated, the skill handles group posting differently:

1. Generate the post content in Facebook's plain-text format (no markdown)
2. Save it as a `.txt` file the user can copy-paste
3. Include posting tips: best times, hashtag placement, engagement hooks
4. Optionally: Generate a Facebook Page post that can be manually shared to groups
