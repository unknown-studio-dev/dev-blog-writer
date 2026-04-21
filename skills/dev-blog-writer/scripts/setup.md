# Dev Blog Writer Setup

Run this flow when `config.json` doesn't exist in the data directory, or when the user says "reconfigure blog settings" or "change my blog setup".

**Important:** The skill directory is read-only. All data files (`config.json`, `voice-profile.json`) must be saved to the writable data directory at `<workspace>/.claude/dev-blog-writer/`. Create this directory with `mkdir -p` before saving anything.

## Setup questions

Ask these in order. If the user provides a website URL, try to fetch it and pre-fill as much as possible (company name, tagline, products, team info). This saves the user time and shows you're paying attention.

### 1. Company basics
- What's your company or project name?
- Do you have a website? (If yes, read it to auto-fill context)
- Short tagline or description (1 sentence)

### 2. Products
- What products are you building? For each:
  - Name
  - One-line description
  - Type (mobile app, web app, open-source tool, SaaS, etc.)
  - URL or repo link
  - Any unique technical details worth mentioning in posts

### 3. Team
- How many people on the team?
- Key roles (founder, co-founder, engineer, designer, etc.)
- Is this primarily one person's voice or a team blog?

### 4. Audience
- Who reads your blog? Options:
  - Indie hackers and founders
  - Developers and engineers
  - Potential users of your products
  - Vietnamese tech community
  - Mixed audience
  - Other (describe)

### 5. Voice and tone
- How should the posts sound? Options:
  - Casual and personal (like talking to a friend)
  - Professional but friendly (polished but warm)
  - Technical and concise (straight to the point)
  - Other (describe)

### 6. Language preferences
- What language do you write in? Options:
  - English only
  - Vietnamese only
  - Mixed (Vietnamese body + English tech terms) — recommended for Vietnamese dev community
  - Bilingual (write both versions)

If Vietnamese or Mixed is selected, ask:

#### 6a. Vietnamese style
- Regional tone preference:
  - Southern (Sài Gòn) — casual, "anh em", more emotional, storytelling
  - Northern (Hà Nội) — slightly more measured, "các bạn" sometimes used
  - Neutral — works for the widest audience (default)

#### 6b. Formality level
- Ultra-casual (Facebook Group style — slang, emoji, interjections)
- Semi-casual (Blog/Viblo style — personal but structured)
- Semi-formal (Professional blog — warm but polished)

#### 6c. Vietnamese community context
- Which Vietnamese tech communities are you active in? (optional, for tone reference)
  - Facebook Groups (which ones?)
  - Viblo
  - Threads Vietnamese tech scene
  - Other

### 7. Platform
- Where do you publish? Present ALL of these options to the user — do not truncate or summarize the list:
  - Substack
  - Medium
  - Hashnode
  - Dev.to
  - Ghost (self-hosted)
  - Viblo
  - Reddit
  - Facebook (Page and/or Groups)
  - Threads
  - Multiple (pick a default)
  - Other (let the user type)

If the user selects **Reddit**, ask:
  - Which subreddits do you post to? (helps tailor titles and framing per community)
  - Is your Reddit account ready? (30+ days old, 200+ comment karma). If not, advise warm-up period — see `references/platforms/reddit.md` for the account warm-up checklist.
  - Do you prefer self-posts (full content on Reddit) or link posts (link to blog)? Default recommendation: self-post with blog link at the bottom.
- If the user selects multiple platforms, ask which one is their primary/default.

### 8. Post sizes
- What types of posts do you typically write? (select all that apply):
  - Short posts (50-250 words) — social media, quick updates
  - Medium posts (250-800 words) — build-in-public updates, announcements
  - Long posts (800+ words) — blog posts, technical deep-dives
  - All of the above

### 9. Blog URL
- What's your blog URL? (for linking in posts)

### 10. Social profiles (optional)
- Facebook Page URL?
- Threads profile URL?
- Other social profiles?

### 11. Existing posts (optional)
- Do you have any published posts I can read for tone reference? (URLs)

### 12. MCP Publishing (optional)
- Do you want to publish directly from here? If yes, we'll check for available publishing MCPs.
  - Run `search_mcp_registry` for platform publishing tools
  - If MCPs found, offer to connect them via `suggest_connectors`
  - Document which platforms have direct publishing enabled

### 13. Visual diagrams (automatic check)

Check if the Mermaid rendering MCP tool (`validate_and_render_mermaid_diagram`) is available. This determines whether the skill can automatically render diagrams to PNG for platforms that don't support native Mermaid (Medium, Substack, Ghost, Facebook, Threads).

- **If available:** Record `"mermaid_rendering": { "available": true, "method": "mcp" }` in config. No user action needed — just inform them: *"I can generate visual diagrams for your posts and automatically render them for any platform."*
- **If not available:** Check if the user's platforms need PNG rendering (i.e., any platform other than Dev.to, Hashnode, or Viblo). If yes:
  - Inform: *"For [platform names], diagrams need to be rendered as images. I can still generate Mermaid diagram source code, but you'd need to export them manually using [Mermaid Live Editor](https://mermaid.live)."*
  - Record `"mermaid_rendering": { "available": false, "method": null }` in config.
- **If all platforms support native Mermaid:** PNG rendering isn't needed. Record `"mermaid_rendering": { "available": true, "method": "native" }` in config.

### 14. Voice profile (optional, for returning users)
- If the user is migrating from a previous setup or reinstalling the skill, ask:
  - Do you have an existing `voice-profile.json` you'd like to import?
  - If yes: copy it into the data directory (`<workspace>/.claude/dev-blog-writer/`). The skill will pick it up and apply all learned preferences immediately.
  - If no: that's fine — the voice profile builds itself over time through the feedback loop. No action needed.
- If the user has existing published posts (from step 11), offer to bootstrap a starter voice profile by analyzing 2-3 posts for tone, vocabulary patterns, and structural preferences. Save the analysis as an initial `voice-profile.json` with a note that these are inferred, not confirmed by feedback. The confidence level starts at `learning` regardless.

## Saving the config

After collecting answers, save to `config.json` in the **data directory** (`<workspace>/.claude/dev-blog-writer/`) with this structure:

```json
{
  "company": {
    "name": "Company Name",
    "url": "https://example.com",
    "tagline": "Short tagline",
    "methodology": "Brief description of how you work"
  },
  "products": [
    {
      "name": "Product Name",
      "description": "One-line description",
      "type": "mobile app",
      "url": "https://product.com",
      "technical_context": "Key technical details worth mentioning"
    }
  ],
  "team": {
    "size": 2,
    "members": [
      {"name": "Name", "role": "Founder", "focus": "Product & Strategy"}
    ],
    "voice": "solo"
  },
  "audience": "mixed",
  "tone": "casual",
  "language": {
    "primary": "mixed",
    "vietnamese": {
      "regional_tone": "southern",
      "formality": "semi-casual",
      "communities": ["Facebook Groups", "Viblo"]
    }
  },
  "platform": {
    "default": "substack",
    "all": ["substack", "facebook", "threads"],
    "blog_url": "https://your.substack.com",
    "social": {
      "facebook_page": "https://facebook.com/yourpage",
      "threads": "https://threads.net/@yourhandle",
      "reddit": "https://reddit.com/u/yourhandle"
    },
    "reddit": {
      "target_subreddits": ["programming", "SideProject"],
      "post_style": "self-post",
      "account_ready": true
    }
  },
  "post_sizes": ["short", "medium", "long"],
  "publishing": {
    "mcp_available": false,
    "platforms_connected": [],
    "mcp_provider": null
  },
  "mermaid_rendering": {
    "available": true,
    "method": "mcp"
  },
  "reference_posts": []
}
```

## Presets

Check `references/presets/` for example configs. If the user's setup is similar to a preset, offer to start from it and customize. This saves time for common setups.

## After setup

Confirm the config back to the user in a brief summary. Tell them they can reconfigure anytime by saying "reconfigure blog settings".

If the user selected Vietnamese language, mention that the skill will:
- Use natural Vietnamese code-switching (Vietnamese narrative + English tech terms)
- Apply Vietnamese emotional expression and particles
- Follow anti-AI voice patterns specific to Vietnamese
- Adapt tone to their regional preference

If the user writes long posts (800+ words), mention that the skill can:
- Suggest visual diagrams (architecture, flowcharts, timelines, etc.) for sections that benefit from a visual explanation
- Automatically render diagrams in the right format for each platform
- Keep diagram labels in the same language as the post, with natural code-switching for technical terms

Also mention that the skill learns from feedback:
- After each draft, it may ask for feedback on tone, structure, and word choices
- Over time, it asks less as it learns the user's preferences
- All learned preferences are stored in `voice-profile.json` and applied automatically to future drafts
- The user can reset the voice profile anytime by saying "reset my voice profile" or deleting `voice-profile.json`
