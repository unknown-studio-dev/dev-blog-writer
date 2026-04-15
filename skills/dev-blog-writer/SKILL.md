---
name: dev-blog-writer
description: >
  This skill should be used when the user asks to "write a blog post", "draft a dev blog",
  "write about a feature", "draft a post", "build in public", "announce a feature",
  "write up", "newsletter", or wants to share their building journey, explain a technical
  decision, or announce something about their product. Also use when the user asks for
  "blog outlines", "post ideas", or "improving a draft". Supports Substack, Medium,
  Hashnode, Dev.to, and Ghost. Handles build-in-public updates, technical deep-dives,
  product announcements, and studio/process posts. Even if the user just says
  "I want to write something about X", this skill should be triggered.
---

# Dev Blog Writer

Help makers, founders, and dev teams write dev blog posts that sound human, earn technical respect, and turn readers into users.

## First-time setup

On first use (no `config.json` exists in this skill's directory), run the setup flow:

1. Read `scripts/setup.md` for the interactive setup questions
2. Walk the user through configuration (company, products, tone, audience, platform)
3. Save results to `config.json` in this skill's directory

If `config.json` exists, load it silently at the start. The user can re-run setup anytime by saying "reconfigure blog settings" or "change my blog setup".

Check `references/presets/` for example configs the user can start from.

## Config-driven context

Read `config.json` to understand who you're writing for. It contains:
- Company name, URL, tagline, and product descriptions
- Team info and methodology notes
- Target audience and tone preferences
- Default platform (substack, medium, hashnode, devto, ghost)
- Any product-specific context the user added during setup

Use this context to personalize every post. Never ask for info that's already in the config.

## Core workflow

When the user wants to write a post:

1. **Clarify the basics** (skip what you already know from config):
   - Which product is this about?
   - What type of post? (build-in-public, technical deep-dive, announcement, or process)
   - What specifically happened, and what's the interesting part?

2. **Load the right references** (only what you need for this post):
   - Read `references/post-templates.md` for the matching post type structure
   - Read the platform file from `references/platforms/` matching the user's config
   - Read `references/anti-ai-voice.md` before writing any draft

3. **Draft the post** following the loaded template, platform rules, and anti-AI-voice guidelines.

4. **Write the headline last.** Draft 3-5 options after the body is done.

5. **Check the opening.** Read the first 3 sentences. Would you keep reading if this showed up in your inbox? If not, rewrite them.

6. **Deliver as markdown** with: headline (H1), subtitle (italic), body with H2 sections, 3-5 alternative headlines at the bottom, and suggested tags for the platform.

Save output as a `.md` file the user can copy-paste into their editor.

## Voice principles (always apply these, even before loading references)

- Write as a person, not a brand. Use "I" for solo founders, "we" for teams.
- Write like you talk. Cut any word you wouldn't say out loud.
- Short paragraphs. Vary their lengths wildly. Some are one sentence. Others ramble.
- Show emotion! Exclamation marks, genuine reactions, frustration, excitement.
- Include the messy details: the 2am debugging, the accidental push to main.
- The ratio is ~70% value/story, 30% product.
- Never start with "Hey everyone!" or "Welcome back!". Jump into the content.

## Critical: read anti-ai-voice.md before every draft

The single most important reference file is `references/anti-ai-voice.md`. It contains specific patterns that make writing sound machine-generated and how to avoid them. Read it before writing any draft. This is what separates a useful post from one readers scroll past.

## Reference files

Load these on demand, not all at once:

| File | When to load |
|------|-------------|
| `references/anti-ai-voice.md` | Before writing ANY draft |
| `references/post-templates.md` | When you need structure for a specific post type |
| `references/platforms/substack.md` | When writing for Substack |
| `references/platforms/medium.md` | When writing for Medium |
| `references/platforms/hashnode.md` | When writing for Hashnode |
| `references/platforms/devto.md` | When writing for Dev.to |
| `config.json` | At the start of every session |
| `scripts/setup.md` | Only during first-time setup or reconfiguration |
| `references/presets/*.json` | Only during setup, as starting templates |

## Output format

Deliver every post as a markdown file containing:

- **Headline** (H1)
- **Subtitle** (italic, below headline)
- **Body** with H2 sections, bold key phrases, code blocks where relevant
- **3-5 alternative headline options** at the end
- **Suggested tags** (3-5 tags relevant to the post and platform)
