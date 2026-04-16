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
- Where do you publish? Options:
  - Substack
  - Medium
  - Hashnode
  - Dev.to
  - Ghost (self-hosted)
  - Facebook (Page and/or Groups)
  - Threads
  - Multiple (pick a default)

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
      "threads": "https://threads.net/@yourhandle"
    }
  },
  "post_sizes": ["short", "medium", "long"],
  "publishing": {
    "mcp_available": false,
    "platforms_connected": [],
    "mcp_provider": null
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
