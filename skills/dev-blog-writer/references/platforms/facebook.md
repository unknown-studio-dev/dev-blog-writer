# Facebook Formatting Guide

Facebook is the dominant social platform in Vietnam's tech community. Facebook Groups like "Hội Lập Trình", "J2Team Community", and niche product groups are where Vietnamese developers share, discuss, and discover content. This guide covers both Facebook Pages (automatable) and Facebook Groups (manual posting).

## Post types and lengths

### Short post (50–200 words)
Quick wins, hot takes, questions, milestone celebrations. These get the highest engagement in groups.

**Structure:**
- Hook line (1 sentence that stops the scroll)
- 2-4 short paragraphs
- Question or call-to-action at the end
- 2-5 relevant emoji as tone markers

### Medium post (200–600 words)
Build-in-public updates, feature announcements, lessons learned. The sweet spot for group engagement.

**Structure:**
- Storytelling hook (personal moment or problem)
- Context (2-3 sentences)
- The meat (what happened, what you built, what you learned)
- Honest reflection or question
- Soft CTA

### Long post (600–1200 words)
Technical walkthroughs, detailed retrospectives. Use sparingly — most Facebook readers prefer short/medium. If it's longer than 1200 words, write a blog post and share a teaser on Facebook.

## Facebook-specific writing rules

**Line breaks are your H2s.** Facebook doesn't support markdown headers. Use blank lines generously to create visual sections. Dense paragraphs get scrolled past.

**Emoji as section markers.** Since you can't use headers, emoji help create visual structure:
```
🔥 The problem
[paragraph]

💡 What I tried
[paragraph]

✅ What worked
[paragraph]
```

**First 3 lines matter most.** Facebook truncates posts behind "See more." Your hook must land in those first 3 lines or people won't expand the post.

**No markdown rendering.** Facebook renders plain text only. No bold, no italic, no code blocks, no links-as-text. Write accordingly:
- Use CAPS sparingly for emphasis (not whole sentences)
- Use line breaks instead of bullet points
- Put URLs on their own line
- Use → or • or - for list-like items

**Hashtags at the end, not inline.** 3-5 hashtags maximum. Vietnamese tech hashtags: #devlife #laptrinhvien #buildinpublic #techvn #startup

## Facebook Group specifics

**Engagement triggers that work in Vietnamese tech groups:**
- "Anh em đã gặp case này chưa?" (Have you guys encountered this case?)
- "Mình vừa phát hiện cái này, chia sẻ cho anh em" (Just found this, sharing with you guys)
- Polls and "A hay B?" (A or B?) format posts
- Before/after comparisons with numbers
- "Mình sai ở đâu?" (Where did I go wrong?) — vulnerability drives engagement

**What gets downvoted/ignored:**
- Pure self-promotion without value
- "Check out my new app" with no story
- Overly formal corporate-speak
- AI-generated content (Vietnamese groups are very sensitive to this)
- Posts that look like ads

## Facebook Pages vs Groups

**Pages (automatable via API/MCP):**
- Professional presence for your product/company
- Can be automated with Facebook Graph API
- Good for official announcements, blog post shares
- Supports scheduling
- Less engagement than groups but more control

**Groups (manual posting required):**
- Facebook deprecated third-party group posting API in April 2024
- Must post manually or use Facebook's native scheduling
- Much higher organic engagement than pages
- Where the Vietnamese dev community actually lives
- Strategy: Write the post content, then user copy-pastes into group

## Output structure for Facebook

### Short post format
```
[Hook line — grab attention immediately]

[Body — 2-4 short paragraphs with line breaks between]

[Question or CTA]

[hashtags]
```

### Medium post format
```
[Storytelling hook — specific moment or emotion]

[Context — what you were doing]

[The journey — what happened, with emotional beats]

[What you learned / built / shipped]

[Honest reflection or question to readers]

---
[Link if relevant]

[hashtags]
```

## What to avoid on Facebook

- Don't use markdown syntax (it won't render)
- Don't write walls of text without line breaks
- Don't post links in the first line (Facebook deprioritizes link-first posts in feed)
- Don't use generic stock-photo covers (screenshots of your actual product work better)
- Don't post the same content to multiple groups simultaneously (groups flag this as spam)
- Don't over-hashtag (max 5, and only at the end)

## Vietnamese-specific Facebook tips

- Post timing: 8-9am, 12-1pm, 8-10pm Vietnam time (UTC+7) for best engagement
- Vietnamese Facebook users heavily consume content on mobile — keep paragraphs to 2-3 sentences max
- Comment replies matter — the algorithm boosts posts where the author actively responds
- "Tag người bạn cần đọc cái này" (Tag a friend who needs to read this) — classic Vietnamese engagement hook, use sparingly
