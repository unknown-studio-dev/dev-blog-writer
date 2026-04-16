# Dev Blog Writer

Write blog posts and social media content that sounds human, earns technical respect, and turns readers into users — in English, Vietnamese, or mixed.

## What it does

This plugin helps makers, founders, and dev teams draft content for Substack, Medium, Hashnode, Dev.to, Ghost, Facebook (Pages and Groups), and Threads. It supports multiple post sizes and types:

- **Short posts** (50-250 words): Quick wins, hot takes, questions, product teasers — for Facebook and Threads
- **Medium posts** (250-800 words): Build-in-public updates, announcements, lessons learned — for social and short blogs
- **Long posts** (800+ words): Technical deep-dives, product announcements, studio/process posts — for blog platforms

## Vietnamese writing support

Full support for writing in Vietnamese or mixed (Vietnamese body + English tech terms), built on how Vietnamese dev communities actually write:

- Natural code-switching ("deploy lên production", not "triển khai lên môi trường sản xuất")
- Emotional particles and interjections ("nha", "á", "trời ơi", "vãi")
- "Tản mạn" storytelling format
- Regional tone options (Northern/Southern/Neutral)
- Vietnamese-specific anti-AI patterns to keep writing authentic

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
- "Viết bài về feature mới mình vừa ship"
- "Tản mạn về hành trình build InstaNote tuần này"

## What makes it different

The plugin includes anti-AI-voice guidelines for both English and Vietnamese that catch and fix patterns that make writing sound machine-generated. Posts come out sounding like a real person wrote them — not a language model.

## Install

### Using Claude Marketplace (Claude Code)

Install directly in Claude Code with two commands:

```
/plugin marketplace add unknown-studio-dev/dev-blog-writer
/plugin install dev-blog-writer@dev-blog-writer
```

### Using .plugin file (Cowork)

Download the latest `.plugin` file from [Releases](https://github.com/unknown-studio-dev/dev-blog-writer/releases) and double-click it, or drag it into Cowork.

### Manual (Claude Code)

Clone and add directly:

```bash
git clone https://github.com/unknown-studio-dev/dev-blog-writer.git
cd dev-blog-writer
/plugin install ./
```
