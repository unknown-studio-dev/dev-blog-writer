---
name: dev-blog-writer
description: >
  This skill should be used when the user asks to "write a blog post", "draft a dev blog",
  "write about a feature", "draft a post", "build in public", "announce a feature",
  "write up", "newsletter", "viết blog", "viết bài", "đăng bài", "chia sẻ", "tản mạn",
  "write a Facebook post", "post to Threads", "social media post", "short post",
  "quick update", or wants to share their building journey, explain a technical decision,
  or announce something about their product. Also use when the user asks for "blog outlines",
  "post ideas", "improving a draft", or "publish this". Supports Substack, Medium, Hashnode,
  Dev.to, Ghost, Facebook, and Threads. Handles build-in-public updates,
  technical deep-dives, announcements, studio/process posts, social posts,
  and product teasers. Supports English, Vietnamese, or mixed language.
  Even if the user just says "I want to write something about X" or
  "mình muốn viết về X", this skill should be triggered.
---

# Dev Blog Writer

Help makers, founders, and dev teams write posts that sound human, earn technical respect, and turn readers into users. Supports blog posts, social media posts, and everything in between — in English, Vietnamese, or mixed.

## Data directory (important — read this first)

The skill's own directory is **read-only** when installed as a plugin. All user data files (`config.json`, `voice-profile.json`) must be stored in a writable data directory, not alongside SKILL.md.

**How to resolve the data directory:**

1. Look for an existing `config.json` by checking these paths in order:
   - `<workspace>/.claude/dev-blog-writer/config.json` (the primary writable location)
   - `<skill-directory>/config.json` (legacy — if found here, migrate it to the writable location)
2. If no config exists anywhere, create the data directory at `<workspace>/.claude/dev-blog-writer/` and run first-time setup.

In Cowork, `<workspace>` is typically the mounted user directory (the parent of `.claude/`). Use `mkdir -p` to create the data directory if it doesn't exist.

Throughout this skill, **"data directory"** always means `<workspace>/.claude/dev-blog-writer/`. All references to saving `config.json` or `voice-profile.json` mean saving to this writable location — never to the skill's own read-only directory.

## First-time setup

On first use (no `config.json` exists in the data directory), run the setup flow:

1. Create the data directory: `<workspace>/.claude/dev-blog-writer/`
2. Read `scripts/setup.md` for the interactive setup questions
3. Walk the user through configuration (company, products, tone, audience, platform, language, post sizes)
4. Save results to `config.json` in the data directory

If `config.json` exists in the data directory, load it silently at the start. The user can re-run setup anytime by saying "reconfigure blog settings" or "change my blog setup".

Check `references/presets/` for example configs the user can start from.

## Config-driven context

Read `config.json` from the data directory to understand who you're writing for. It contains:
- Company name, URL, tagline, and product descriptions
- Team info and methodology notes
- Target audience and tone preferences
- Language settings (English, Vietnamese, mixed) with Vietnamese-specific preferences
- Default platform and all platforms used
- Post size preferences (short, medium, long)
- MCP publishing status
- Any product-specific context the user added during setup

Use this context to personalize every post. Never ask for info that's already in the config.

## Voice profile (learned preferences)

If `voice-profile.json` exists in the data directory, load it silently alongside `config.json`. It contains writing preferences the skill has learned from previous feedback — tone rules, vocabulary preferences, structural patterns, and platform-specific notes.

Apply all voice profile rules before writing any draft. They layer on top of the voice principles below and can override them — the user's actual voice always trumps generic guidelines. See `references/feedback-engine.md` for the full schema and how rules are applied.

If `voice-profile.json` doesn't exist, that's fine — it gets created automatically in the data directory on the first feedback interaction. Don't create it during setup.

## Core workflow

When the user wants to write a post:

1. **Determine the post size and platform** (skip what you already know from config):
   - Short (50-250 words): Facebook, Threads, quick social updates
   - Medium (250-800 words): Facebook medium posts, Threads threads, short blog entries
   - Long (800+ words): Substack, Medium, Hashnode, Dev.to, Ghost, Viblo
   - Which specific platform? Use the default from config if not specified.

2. **Clarify the basics** (skip what you already know from config):
   - Which product is this about?
   - What type of post? (build-in-public, technical deep-dive, announcement, process, hot take, question, teaser)
   - What specifically happened, and what's the interesting part?

3. **Load the right references** (only what you need for this post):
   - Read `references/post-templates.md` for the matching post type and size
   - Read the platform file from `references/platforms/` matching the target
   - Read `references/anti-ai-voice.md` before writing any draft
   - If Vietnamese or mixed language: also read `references/vietnamese-voice.md`

4. **Draft the post** following the loaded template, platform rules, language settings, and anti-AI-voice guidelines.

5. **For long posts: Write the headline last.** Draft 3-5 options after the body is done. For short posts, the hook IS the headline — write it first.

6. **Check the opening.** Read the first 3 sentences (or first 2 lines for short posts). Would you keep reading if this showed up in your feed? If not, rewrite them.

7. **Deliver the post** in the appropriate format for the platform (see Output formats below).

8. **Collect feedback (adaptive).** How you ask depends on the confidence level for this post's context (platform + size + post type). Read `references/feedback-engine.md` for the full logic — here's the short version:

   - **`learning`** (default for new contexts): Ask for detailed feedback. *"How does this feel? Anything you'd change about the tone, word choices, structure, or opening? Or is this good to go?"*
   - **`calibrated`** (4+ consecutive approvals): Ask lightly. *"Anything to tweak, or good to go?"*
   - **`confident`** (8+ consecutive approvals): Skip asking. Just deliver and add: *"If anything feels off, just let me know."*

   When feedback arrives, classify it and respond:
   - **Substantive feedback** (specific corrections or preferences): Extract preference rules, store in `voice-profile.json`, reset approval streak for this context, revise the draft, and re-deliver. If already at `confident` level, first ask: *"Got it — should I treat this as your new default going forward, or just for this post?"*
   - **Minor adjustment** (small one-off tweaks): Apply the change, don't update voice profile, keep the streak.
   - **Approval** ("looks good", "ship it", etc.): Log it, increment streak, recalculate confidence, move on.

   Repeat the feedback-revise cycle until the user approves. Then proceed to publishing.

9. **Offer to publish** if MCP publishing is configured (see Publishing section below).

10. **Offer cross-platform versions** if the user publishes to multiple platforms. A blog post can become a Facebook teaser, a Threads thread, etc.

## Voice principles (always apply these, even before loading references)

- Write as a person, not a brand. Use "I" / "mình" for solo founders, "we" / "bọn mình" for teams.
- Write like you talk. Cut any word you wouldn't say out loud.
- Short paragraphs. Vary their lengths wildly. Some are one sentence. Others ramble.
- Show emotion! Exclamation marks, genuine reactions, frustration, excitement.
- Include the messy details: the 2am debugging, the accidental push to main.
- The ratio is ~70% value/story, 30% product.
- Never start with "Hey everyone!" or "Welcome back!" or "Xin chào mọi người!". Jump into the content.

## Vietnamese writing principles (apply when language is Vietnamese or mixed)

These are in addition to the voice principles above. Vietnamese writing has its own rhythm.

- Default to "mình" as first-person. It's inclusive and warm.
- Address readers as "anh em" (casual/Facebook) or "mọi người" (neutral/blog).
- Mix Vietnamese narrative with English tech terms naturally. "Deploy lên production" not "Triển khai lên môi trường sản xuất."
- Use emotional particles: "nha", "á", "luôn", "nè", "ha". They're not filler — they're tone.
- Use interjections: "Trời ơi", "Ủa", "Vãi", "Mệt". They signal authenticity.
- Start with a story or moment, not a definition. The "Tản mạn:" format is beloved.
- Emoji as tone markers (not decoration): 😆 🔥 ✨ 💡 😤
- Assume shared knowledge. Don't over-explain basics.

Read `references/vietnamese-voice.md` for the full guide before writing any Vietnamese content.

## Critical: read anti-ai-voice.md before every draft

The single most important reference file is `references/anti-ai-voice.md`. It contains specific patterns that make writing sound machine-generated and how to avoid them — for both English and Vietnamese. Read it before writing any draft. This is what separates a useful post from one readers scroll past.

## Publishing

After drafting, offer to publish directly if MCP tools are available. Read `references/mcp-integration.md` for the full workflow.

**Quick publishing flow:**
1. Check if publishing MCPs are connected (from config or by checking available tools)
2. If yes: Format content for the target platform and publish via MCP
3. If no: Offer to search the MCP registry (`search_mcp_registry`) for publishing connectors
4. If still no: Save platform-ready content as a file for manual posting

**Facebook Groups note:** Facebook deprecated group posting API in April 2024. For groups, generate copy-paste ready content in plain text format.

**Cross-posting:** When publishing to multiple platforms, publish to the primary (blog) first, then adapt and publish social versions with canonical URLs.

## Reference files

Load these on demand, not all at once:

| File | When to load |
|------|-------------|
| `references/anti-ai-voice.md` | Before writing ANY draft |
| `references/feedback-engine.md` | When processing feedback or updating voice profile |
| `references/vietnamese-voice.md` | When writing in Vietnamese or mixed language |
| `references/post-templates.md` | When you need structure for a specific post type/size |
| `references/platforms/substack.md` | When writing for Substack |
| `references/platforms/medium.md` | When writing for Medium |
| `references/platforms/hashnode.md` | When writing for Hashnode |
| `references/platforms/devto.md` | When writing for Dev.to |
| `references/platforms/facebook.md` | When writing for Facebook (Pages or Groups) |
| `references/platforms/threads.md` | When writing for Threads |
| `references/mcp-integration.md` | When publishing or setting up publishing |
| `<data-dir>/config.json` | At the start of every session |
| `<data-dir>/voice-profile.json` | At the start of every session (if it exists) |
| `scripts/setup.md` | Only during first-time setup or reconfiguration |
| `references/presets/*.json` | Only during setup, as starting templates |

## Output formats

### Long posts (blog platforms)

Deliver as a markdown file containing:
- **Headline** (H1)
- **Subtitle** (italic, below headline)
- **Body** with H2 sections, bold key phrases, code blocks where relevant
- **3-5 alternative headline options** at the end
- **Suggested tags** (3-5 tags relevant to the post and platform)

### Medium posts (Facebook, short blog)

Deliver as a markdown file containing:
- **Headline or hook** (H1)
- **Body** with minimal formatting (H2 sections optional)
- **2-3 alternative hooks** at the end
- **Suggested tags/hashtags**

### Short posts (Facebook, Threads)

Deliver as a plain text file (`.txt`) containing:
- **The post** in platform-ready format (no markdown for Facebook/Threads)
- **2-3 alternative versions** of the hook/opening
- **Suggested hashtags** (3-5)

For Threads threads, deliver numbered posts (1/N, 2/N, etc.).

### Cross-platform bundle

When the user publishes to multiple platforms, offer to generate all versions:
- Full blog post (markdown)
- Facebook medium post (plain text)
- Threads thread (plain text, numbered)
- Quick teaser (1-3 sentences + link)

Save each as a separate file with clear naming: `post-title-substack.md`, `post-title-facebook.txt`, `post-title-threads.txt`.
