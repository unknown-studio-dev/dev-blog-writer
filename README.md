# Dev Blog Writer

Write blog posts and social media content that sounds human, earns technical respect, and turns readers into users — in English, Vietnamese, or mixed.

## What it does

This plugin helps makers, founders, and dev teams draft content for Substack, Medium, Hashnode, Dev.to, Ghost, Viblo, Reddit, Facebook (Pages and Groups), and Threads. It supports multiple post sizes and types:

- **Short posts** (50-250 words): Quick wins, hot takes, questions, product teasers — for Facebook and Threads
- **Medium posts** (250-800 words): Build-in-public updates, announcements, lessons learned — for social, Reddit, and short blogs
- **Long posts** (800+ words): Technical deep-dives, product announcements, studio/process posts — for blog platforms and Reddit

## Vietnamese writing support

Full support for writing in Vietnamese or mixed (Vietnamese body + English tech terms), built on how Vietnamese dev communities actually write:

- Natural code-switching ("deploy lên production", not "triển khai lên môi trường sản xuất")
- Emotional particles and interjections ("nha", "á", "trời ơi", "vãi")
- "Tản mạn" storytelling format
- Regional tone options (Northern/Southern/Neutral)
- Vietnamese-specific anti-AI patterns to keep writing authentic

## Visual diagrams

For long posts (800+ words), the plugin proactively suggests 1-2 visual diagrams where they would improve comprehension. Diagrams are generated in Mermaid format and automatically adapted for each platform:

- **Native Mermaid** (Dev.to, Hashnode, Viblo): Embedded as code blocks that render directly
- **PNG fallback** (Medium, Substack, Ghost, Reddit, Facebook, Threads): Rendered to images via MCP tool or exported manually

The plugin picks the right diagram type based on your content — architecture diagrams for technical deep-dives, timelines for build-in-public updates, flowcharts for process posts, cause-effect diagrams for lessons learned. Labels follow your post's language with natural code-switching for technical terms.

## Reddit support

Reddit is the hardest platform to penetrate but drives massive qualified traffic. The plugin includes a comprehensive Reddit strategy guide covering:

- **Karma and account requirements** — warm-up checklist, minimum thresholds, how to build credibility
- **Self-promotion rules** — the 10% guideline, what gets flagged as spam, how to share without getting banned
- **Subreddit targeting** — 30+ dev/tech subreddits categorized by content type and promotion tolerance
- **Value-first hybrid format** — full substance in the self-post, blog link as optional further reading
- **Reddit-compatible formatting** — 4-space code blocks for Old Reddit, no inline images, subreddit-specific titles

The plugin generates Reddit posts with distinct titles per subreddit, proper flair notes, and the right framing for each community.

## MCP publishing

Publish directly to platforms via MCP connectors (Ayrshare, BulkPublish, or platform-specific MCPs). Includes graceful fallback when MCPs aren't available — generates platform-ready files for manual posting.

## Setup

On first use, the plugin asks about your company, products, team, audience, tone, language preferences, and platforms. Your answers are saved so you only set up once. Reconfigure anytime by saying "reconfigure blog settings".

## How to use

Just ask naturally:
- "Write a blog post about the new search feature I shipped"
- "Draft a build-in-public update about this week's progress"
- "Write a Facebook post about our latest milestone"
- "Post a hot take on Threads about spec-driven development"
- "Write a Reddit post about this side project for r/SideProject and r/programming"
- "Viết bài về feature mới mình vừa ship"
- "Tản mạn về hành trình build InstaNote tuần này"

## Adaptive voice learning

The plugin learns your writing style through a feedback loop. After each draft, it may ask for feedback on tone, word choices, and structure. Over time:

- It builds a **voice profile** with your preferences (stored in `voice-profile.json`)
- It asks less as it gets better at matching your voice
- Confidence is tracked per platform and post type — it might nail your Facebook posts but still be learning your Substack style
- You can give one-off overrides without resetting what it's learned

## What makes it different

The plugin includes anti-AI-voice guidelines for both English and Vietnamese that catch and fix patterns that make writing sound machine-generated. Posts come out sounding like a real person wrote them — not a language model.

## Skill-gate (quality enforcement)

The plugin includes built-in hooks that prevent the agent from drafting before reading critical reference files. This solves a common problem where AI agents skip configuration and reference files out of overconfidence, producing generic output.

Before any Write or Edit call, the gate checks that the agent has read:

- **config.json** — your company, products, audience, and tone settings
- **anti-ai-voice.md** — patterns that make writing sound machine-generated
- **A platform file** — formatting rules for the target platform (Substack, Facebook, etc.)

If any are missing, the Write/Edit is blocked with a message telling the agent exactly which files to read. The gate activates only when the agent starts reading skill files, so it won't interfere with unrelated work. It also fails open — if something breaks, the gate approves rather than blocking the session.

Inspired by [Thoth](https://github.com/unknown-studio-dev/thoth)'s gate mechanism, simplified for single-skill enforcement.

## Install

### Cowork (recommended)

Add this repo as a marketplace source in Cowork:

1. Open **Customize** (top-left) → **Plugins** → **Personal** tab
2. Click the **+** button to add a marketplace
3. Enter `unknown-studio-dev/dev-blog-writer` and click **Sync**
4. The plugin appears in your Personal plugins — toggle it on

This keeps the plugin in sync with the latest version from the repo.

### Claude Code — via marketplace

```
/plugin marketplace add unknown-studio-dev/dev-blog-writer
/plugin install dev-blog-writer@dev-blog-writer
```

### Claude Code — manual

```bash
git clone https://github.com/unknown-studio-dev/dev-blog-writer.git
cd dev-blog-writer
/plugin install ./
```
