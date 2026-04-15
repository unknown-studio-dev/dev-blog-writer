# Dev Blog Writer Setup

Run this flow when `config.json` doesn't exist, or when the user says "reconfigure blog settings" or "change my blog setup".

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
  - Mixed audience
  - Other (describe)

### 5. Voice and tone
- How should the posts sound? Options:
  - Casual and personal (like talking to a friend)
  - Professional but friendly (polished but warm)
  - Technical and concise (straight to the point)
  - Other (describe)

### 6. Platform
- Where do you publish? Options:
  - Substack
  - Medium
  - Hashnode
  - Dev.to
  - Ghost (self-hosted)
  - Multiple (pick a default)

### 7. Blog URL
- What's your blog URL? (for linking in posts)

### 8. Existing posts (optional)
- Do you have any published posts I can read for tone reference? (URLs)

## Saving the config

After collecting answers, save to `config.json` in the skill directory with this structure:

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
  "platform": {
    "default": "substack",
    "blog_url": "https://your.substack.com"
  },
  "reference_posts": []
}
```

## Presets

Check `references/presets/` for example configs. If the user's setup is similar to a preset, offer to start from it and customize. This saves time for common setups.

## After setup

Confirm the config back to the user in a brief summary. Tell them they can reconfigure anytime by saying "reconfigure blog settings".
