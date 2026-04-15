# Dev Blog Writer

Write dev blog posts that sound human, earn technical respect, and turn readers into users.

## What it does

This plugin helps makers, founders, and dev teams draft blog posts for Substack, Medium, Hashnode, Dev.to, and Ghost. It supports four post types: build-in-public updates, technical deep-dives, product announcements, and studio/process posts.

## Setup

On first use, the plugin asks about your company, products, team, audience, tone, and preferred platform. Your answers are saved so you only set up once. Reconfigure anytime by saying "reconfigure blog settings".

## How to use

Just ask naturally:
- "Write a blog post about the new search feature I shipped"
- "Draft a build-in-public update about this week's progress"
- "Help me write a technical deep-dive about our sync architecture"
- "I want to announce our new AI-powered feature"

## What makes it different

The plugin includes anti-AI-voice guidelines that catch and fix patterns that make writing sound machine-generated (em dash overuse, uniform paragraph lengths, vague endings, bullet point fragments). Posts come out sounding like a real person wrote them.

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
