# Reddit Formatting Guide

Reddit is the hardest platform to penetrate but among the most rewarding — a single well-received post can drive thousands of highly qualified developer visitors. The challenge: Reddit's systems (both automated and human) are specifically designed to detect and punish self-promotion. You must be a community member first, a content distributor second.

## The cardinal rule

**Reddit is not a broadcasting platform.** It is a forum of communities. The moment you treat it as a distribution channel, you get filtered, downvoted, or banned. Every strategy below serves one goal: making your post feel like a genuine contribution, not marketing.

## Karma and account requirements

Before you can even post in most subreddits, your account needs to pass invisible thresholds:

**Minimum requirements (safe baseline):**
- Account age: 30+ days
- Comment karma: 200+ (more important than post karma)
- Engagement history: visible pattern of commenting in target subreddits

**How to build karma:**
- Answer questions in subreddits like r/learnprogramming, r/webdev, r/ExperiencedDevs
- Share helpful comments on other people's posts in your target subreddits
- Share other people's interesting content (not your own) to build post karma
- Takes 4-8 weeks of genuine participation before attempting content distribution

**What happens without enough karma:**
- Posts are silently removed by AutoModerator — they appear to you but nobody else sees them
- No notification is sent. Check visibility by viewing the subreddit in an incognito window.
- Rate limiting: new/low-karma accounts may be restricted to one post or comment every ~10 minutes

## Self-promotion rules

**The 10% guideline:** No more than 10% of your total Reddit activity should link to your own content. The rest should be genuine community participation (commenting, sharing others' content). This was officially retired from site-wide rules but is still enforced by most subreddit moderators.

**What triggers the spam filter:**
- Posting the same URL to multiple subreddits simultaneously
- Account history that is mostly links to one domain
- Posting and deleting content that didn't perform well
- Using alt accounts to upvote your own posts (vote manipulation — serious offense)
- Using URL shorteners or redirect links (auto-filtered site-wide)
- Low-effort titles like "Check out my new tool!"

**How to self-promote without getting flagged:**
- Use the "value-first" hybrid approach (see Content strategy below)
- Maintain a 10:1 ratio of genuine comments/contributions per self-post
- Never cross-post to more than 2-3 subreddits per article, spaced 1-2 days apart
- Respond to every comment on your own posts (signals genuine engagement)
- Vary your framing/title for each subreddit — don't use identical text

## Target subreddits for dev content

### Best for technical blog posts

| Subreddit | Subscribers | Self-promo OK? | Best content type |
|-----------|-------------|----------------|-------------------|
| r/programming | ~6M | Yes (if high quality) | Deep technical posts, postmortems, "how we built X" |
| r/coding | ~2M | Yes (more relaxed) | General programming content, tutorials |
| r/webdev | Showoff Saturday only | Limited | Practical tutorials, tool comparisons |
| r/javascript | ~2.5M | Yes (no "blogspam") | JS ecosystem deep dives, library announcements |
| r/Python | ~1.5M | Weekly thread | Data science, Python library showcases |
| r/rust | ~300k | Yes (welcoming) | Rust blog posts, project announcements |
| r/golang | ~250k | Yes (tolerant) | Go content, library releases |
| r/typescript | ~200k | Yes | TypeScript patterns, type system explorations |
| r/reactjs | ~500k | Yes | React patterns, library announcements |
| r/node | ~250k | Yes | Node.js content, project announcements |
| r/devops | ~300k | Yes (with substance) | CI/CD comparisons, infrastructure case studies |
| r/machinelearning | ~3M | Strict flair required | Research papers, implementations, benchmarks |

### Best for build-in-public / product showcases

| Subreddit | Subscribers | Notes |
|-----------|-------------|-------|
| r/SideProject | ~150k | **Explicitly for self-promotion.** Tell the story, show the tech. |
| r/indiehackers | ~50k | Revenue milestones, build-in-public updates |
| r/selfhosted | ~350k | Open-source project announcements welcome |
| r/opensource | ~200k | Genuinely open-source projects welcome |
| r/coolgithubprojects | ~50k | GitHub project showcases |
| r/InternetIsBeautiful | ~17M | Free, unique tools only (no commercial products) |

### Use carefully (strict rules)

| Subreddit | Warning |
|-----------|---------|
| r/startups | Self-promotion only in monthly thread. Very strict. |
| r/learnprogramming | **No self-promotion at all.** Use only for building karma via helpful comments. |
| r/ExperiencedDevs | No self-promotion. Great for building credibility through insightful comments. |

## Post formatting

Reddit uses a modified markdown. Key differences from standard markdown:

**Code blocks — use 4-space indent for compatibility:**
```
    function hello() {
        console.log("world");
    }
```
Triple-backtick fenced code blocks work on New Reddit and mobile but NOT on Old Reddit (still used by many developers). For maximum reach, use 4-space indentation.

**Other formatting notes:**
- Use `##` or `###` for section headers (not `#` which renders too large)
- Two newlines required for paragraph breaks
- No inline images in self-posts (link to hosted images instead)
- No HTML rendering (Reddit strips all HTML)
- Tables work on New Reddit only — avoid if Old Reddit audience matters
- Lists need 4 spaces for nesting (not 2)

**Character limits:**
- Title: 300 characters (aim for under 100)
- Self-post body: 40,000 characters
- Comments: 10,000 characters

**Flair:** Many subreddits require post flair. Check before posting — missing flair triggers AutoModerator removal.

## Content strategy

### The value-first hybrid approach (recommended)

This is the only strategy that consistently works for dev content on Reddit:

1. Write and publish the blog post on your site
2. Create a Reddit **self-post** (not a link post) with a compelling, specific title
3. Write a substantial adapted version in the self-post body — not just a teaser. Include key insights, code examples, and takeaways. **The post must stand alone without the link.**
4. At the bottom, add: *"Full post with more detail/diagrams/code on my blog: [link]"*
5. Engage actively in every comment thread

**Why this works:**
- Provides value without forcing users off Reddit (reduces "blogspam" perception)
- Satisfies self-promotion rules (the post is useful even without the link)
- Users who want more depth click through naturally
- Comment engagement boosts visibility in Reddit's algorithm

### Link posts (use sparingly)

Only link directly to your blog when:
- The content is genuinely exceptional and can't be summarized
- You're posting in r/programming or similar link-friendly subreddits
- Your account has established credibility in the community
- The title makes the value immediately obvious

### What gets upvoted in dev subreddits

- **"I built X" with a story:** Problem → why existing solutions failed → what you built → tech stack → lessons learned. Screenshots and demos required.
- **Deep technical explanations:** How DNS works, implementing a database from scratch, debugging a race condition. Depth and clarity win.
- **Postmortems and failure stories:** "How we took down production for 3 hours." Honesty resonates.
- **Controversial but substantiated opinions:** "Microservices are making you slower" backed with real experience.
- **Free tools and resources:** Anything providing immediate, free value.
- **Specific titles with numbers:** "How we reduced our Docker image from 1.2GB to 40MB" beats "Docker optimization tips."

### What gets downvoted or removed

- Thinly-veiled product launches ("Check out my new SaaS!")
- Shallow listicles ("10 JavaScript tricks you didn't know")
- Engagement-bait titles (developer communities are allergic to clickbait)
- Posts where the author doesn't respond to comments
- Paywall or email-gated content
- AI-generated or clearly low-effort content (the dev community is hostile to this in 2025-2026)
- Repeat posting of content that underperformed

## Timing

- Best posting times: **Tuesday through Thursday, 8-10 AM US Eastern Time**
- Catches both US morning and European afternoon audiences
- Avoid weekends for technical content (engagement drops significantly)
- Monday and Friday are middling

## Shadowbanning and AutoModerator

**Shadowban triggers** (applied by Reddit admins, site-wide):
- Posting the same URL to many subreddits quickly
- Unnatural post-to-domain ratio (mostly your own content)
- Vote manipulation (alts, asking friends to upvote)
- IP addresses associated with spam (some VPNs trigger this)
- Using URL shorteners

**How to check:** View your profile in an incognito browser. "Page not found" = shadowbanned.

**AutoModerator (per-subreddit):**
- Silently removes posts from new/low-karma accounts
- Filters posts with blacklisted domains or promotional phrases
- Requires post flair in many subreddits
- Rate-limits frequent posters
- Removals are silent — always verify visibility in incognito

## What to absolutely avoid

1. Don't automate posting (Reddit detects scheduled/bot posts)
2. Don't ask for upvotes anywhere (Discord, Slack, Twitter — vote brigading is serious)
3. Don't use multiple accounts to post or upvote
4. Don't delete and repost content that underperformed (tracked)
5. Don't post identical titles/text across subreddits
6. Don't ignore subreddit-specific rules — read the sidebar/wiki before every first post
7. Don't cross-post to more than 2-3 subreddits per article

## Mermaid diagram support

Reddit does NOT render Mermaid diagrams. Diagrams must be:
- Rendered to PNG
- Hosted externally (Imgur is traditional for Reddit, or your own domain)
- Linked in the self-post body: `[Diagram: System Architecture](https://i.imgur.com/xxxxx.png)`

Note: Reddit self-posts cannot embed inline images. Images are always links that open in a new context. For visual-heavy content, consider posting the full article as a link post instead of a self-post, so readers see diagrams rendered naturally on your blog.

## Output structure for Reddit

Reddit posts should be delivered as a `.md` file optimized for copy-pasting into Reddit's editor:

```markdown
**Title:** Your Specific, Value-Driven Title Here

**Target subreddit(s):** r/subreddit1 (primary), r/subreddit2 (secondary)

**Flair:** [Required flair if applicable]

---

## [Post body starts here — use ## not #]

[Adapted content using Reddit-compatible markdown]

[4-space indented code blocks for compatibility]

    function example() {
        return "hello";
    }

[Key insights and value delivered directly in the post]

---

*Originally posted on my blog where I have more posts like this: [link]*

---

**Alternative titles:**
1. Option A (more specific/technical)
2. Option B (more story-driven)
3. Option C (more provocative/opinion)

**Subreddit-specific title variations:**
- r/programming: [technical framing]
- r/SideProject: [build story framing]
```

## Account warm-up checklist

For users new to Reddit or with inactive accounts:

- [ ] Account is 30+ days old
- [ ] 200+ comment karma from genuine participation
- [ ] Active comment history in target subreddits (last 2-4 weeks)
- [ ] Mix of comments on different posts/topics (not just one thread)
- [ ] No history of mass-deletion or spam-like patterns
- [ ] Familiar with target subreddit rules (read sidebar + recent posts)
- [ ] Verified the account is not shadowbanned (incognito check)
