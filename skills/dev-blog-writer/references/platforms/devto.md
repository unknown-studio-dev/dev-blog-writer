# Dev.to Formatting Guide

## Key features to use

**Front matter:** Dev.to uses YAML front matter for metadata. Include title, published status, description, tags, cover image, and series name.

```yaml
---
title: Your Headline Here
published: true
description: A short description for SEO and social cards
tags: javascript, webdev, beginners, tutorial
cover_image: https://your-image-url.com/cover.png
series: your-series-name
---
```

**Liquid tags:** Dev.to supports special embed syntax:
- `{% github user/repo %}` for repo cards
- `{% codepen url %}` for CodePen embeds  
- `{% youtube video_id %}` for YouTube
- `{% tweet tweet_id %}` for tweets
- `{% codesandbox id %}` for CodeSandbox

**Code blocks:** Great syntax highlighting. Always specify the language. Dev.to readers expect well-formatted code.

## Dev.to-specific strengths

**Community engagement:** Dev.to has strong community features. Reactions (heart, unicorn, bookmark) and comments drive visibility. Ask questions to spark discussion.

**Cross-posting friendly:** Dev.to is designed for cross-posting. Set canonical URL if this post lives elsewhere first.

**Tags with followers:** Tags on Dev.to have dedicated followers. Posting with the right tags puts you in front of interested readers immediately.

**Accessibility:** Dev.to's community values accessible writing. Use alt text on images, explain acronyms on first use.

## What to avoid on Dev.to

- Don't write purely promotional content (the community downvotes it quickly)
- Don't skip the description field (it's used for social cards and SEO)
- Don't use more than 4 tags (Dev.to limit)
- Don't forget alt text on images (the community cares about accessibility)
- Don't write walls of text without code examples (Dev.to readers expect practical content)

## Output structure for Dev.to

```markdown
---
title: Headline Here
published: false
description: Short description for social cards
tags: tag1, tag2, tag3, tag4
cover_image: placeholder-for-cover-image
---

[Body with H2 sections, code blocks with language hints, liquid tag embeds]

---

**Alternative headlines:**
1. Option A
2. Option B
3. Option C
```
