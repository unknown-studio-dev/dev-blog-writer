# Threads Formatting Guide

Threads (by Meta) is growing in Vietnam's tech scene as a space for quick takes, build-in-public micro-updates, and casual tech discussion. It sits between Twitter/X's brevity and Facebook's depth.

## Post types and lengths

### Single post (50–250 words)
The bread and butter of Threads. One idea, one insight, one reaction. Think of it as a Facebook status but punchier.

### Thread (multi-post, 3-7 posts)
A series of connected posts that tell a story or walk through a process. Each post should stand alone but build on the previous one.

### Quick take (1–3 sentences)
Hot takes, reactions, questions. The fastest content type. Works well for daily engagement.

## Threads-specific writing rules

**500-character limit per post.** This forces conciseness. In Vietnamese, this is roughly 80-120 words (Vietnamese words are shorter than English on average).

**First post = the hook.** In a thread, the first post must be compelling enough to make people tap "Show thread." Don't waste it on setup.

**One idea per post.** Don't try to pack multiple points into one post. Split them across a thread instead.

**Threads supports:**
- Plain text
- Images (up to 10 per post)
- Links (but they get less reach — put value in the text)
- Hashtags (limited effect, but use 2-3 relevant ones)
- Mentions (@username)

**Threads does NOT support:**
- Markdown formatting
- Bold/italic
- Code blocks
- Polls (unlike Twitter/X)

## Thread structure patterns

### Build-in-public thread (5-7 posts)
```
Post 1: Hook — the most interesting outcome or number
Post 2: Context — what you're building and why
Post 3: What you did this week/sprint
Post 4: The hard part — what didn't work
Post 5: What you learned
Post 6: What's next
Post 7: CTA — try it / follow along / share your experience
```

### Product teaser thread (3-5 posts)
```
Post 1: The problem your users face (relatable pain)
Post 2: Your approach (brief, intriguing)
Post 3: Show it working (screenshot or short description)
Post 4: Where to try it + what's coming next
```

### Hot take / opinion (1-2 posts)
```
Post 1: The take — bold, specific, based on experience
Post 2 (optional): The nuance — "BUT, this depends on..."
```

### Daily/weekly micro-update (1 post)
```
[What you shipped / learned / struggled with today]
[One specific detail that makes it real]
[Emoji or hashtag to categorize]
```

## Vietnamese Threads style

Threads in Vietnam leans very casual. Even more so than Facebook. Think of it as texting your dev friends.

**Tone:**
- Ultra-casual "mình" voice
- Interjections welcome: "Ủa", "Trời ơi", "Vãi"
- Emoji as punctuation, not decoration
- Questions that invite replies
- Self-deprecating humor lands well

**Example Vietnamese Threads posts:**

Quick take:
> Vừa deploy xong, chạy ngon lành trên staging. Lên prod thì tạch 😆 Classic.

Build-in-public:
> Tuần này mình ship được 2 features cho InstaNote. Cái voice-to-text accuracy tăng từ 87% lên 94% cho tiếng Việt. Vẫn struggle với giọng miền Trung nhưng đang improve dần. Ai có tips gì cho speech recognition tiếng Việt không? 🎙️

Hot take:
> Unpopular opinion: Viết spec trước khi code không phải là lãng phí thời gian. Mình tiết kiệm được ~40% thời gian debug nhờ viết spec rõ ràng trước. Fight me.

## Engagement strategies for Threads

- **Reply to your own thread** with additional context or updates — it bumps visibility
- **Ask questions** — Threads' algorithm favors posts that generate replies
- **Cross-reference** — mention your blog post or longer write-up for those who want depth
- **Consistency** — posting 3-5 times/week builds following faster than sporadic long threads
- **Time-sensitive content** works well — "Mình vừa thấy..." (I just saw...), "Hôm nay mình..." (Today I...)

## Output structure for Threads

### Single post
```
[Content — concise, one clear idea]

[Hashtags — 2-3 max, at the end]
```

### Thread (deliver as numbered posts)
```
🧵 1/N
[Hook post — most compelling part]

2/N
[Context or setup]

3/N
[The meat]

...

N/N
[CTA or closing thought]

Hashtags: #tag1 #tag2 #tag3
```

## What to avoid on Threads

- Don't write long paragraphs — if it needs more than 500 chars, make it a thread
- Don't post links without text context (link-only posts get buried)
- Don't use formal language — Threads rewards casualness
- Don't cross-post identical content from Facebook without adapting the format
- Don't use more than 3 hashtags per post
- Don't ignore replies — engagement begets engagement

## Publishing via API

Threads has an official API (Meta Threads API) that supports:
- Creating text posts
- Creating posts with images
- Reading thread replies
- Reply moderation

Authentication uses Meta's OAuth flow with `threads_basic` scope. Posts are created via `POST /threads` endpoint with a `text` parameter.

When MCP publishing is available, the skill can publish directly. See `references/mcp-integration.md` for setup details.
