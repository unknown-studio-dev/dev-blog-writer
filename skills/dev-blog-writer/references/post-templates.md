# Post Type Templates

Pick the template that matches what the user wants to write. These are guardrails, not prison cells. Adapt freely.

Templates are organized by size: short posts (social media), medium posts (social + blog), and long posts (blog platforms).

---

## SHORT POSTS (50–250 words)

Short posts are for Facebook, Threads, and social teasers. They're punchy, emotional, and designed to spark engagement.

### Quick Win / Milestone

Share a small victory. Numbers, screenshots, or a before/after.

```
Hook — The result or number that grabs attention.
       "Mới ship xong, 94% accuracy cho tiếng Việt!" or "Just hit 1,000 users."

Context — One sentence on what this means.

The detail — One specific, interesting thing about how you got here.

CTA — Question or invitation.
      "Anh em đã thử chưa?" or "What's your approach to this?"
```

### Hot Take / Opinion

A bold, specific opinion grounded in your experience. Not generic wisdom.

```
The take — One clear statement. Be specific, not vague.
           "Viết spec trước khi code tiết kiệm 40% thời gian debug."

The evidence — One supporting detail from your own work.

The nuance (optional) — "But this breaks down when..."

Invitation — "Fight me" or "Anh em nghĩ sao?"
```

### Question / Discussion Starter

Ask something genuine. Not rhetorical, something you actually want answered.

```
Context — Brief setup (1-2 sentences).
          "Mình đang build cái speech-to-text app..."

The question — Specific, answerable.
              "Ai có kinh nghiệm optimize model cho giọng miền Trung không?"

Your current approach (optional) — Shows you've tried, not just asking lazily.
```

### Product Teaser

A sneak peek at something coming. Build anticipation without being salesy.

```
The problem — Relatable pain point (1-2 sentences).

The hint — What you're building to solve it, without revealing everything.

The visual — Describe or include a screenshot.

Timeline — "Coming next week" or "Đang beta test."
```

---

## MEDIUM POSTS (250–800 words)

Medium posts work on Facebook, Threads (as threads), Reddit self-posts, and shorter blog entries. They tell a story but don't go deep technically.

### Build-in-Public Update

Share what you built, what you learned, and what's next. Readers follow along because they're on the journey with you.

```
Hook — Start with the most interesting thing that happened.
       Not "This week I worked on..." but a specific moment, surprise, or mistake.

Context — Brief setup. Where were you before? What were you trying to do?
          If working across multiple products, mention which one.

The meat — Walk through what you did, decisions you made, and why.
           Include specifics: numbers, before/after, architecture choices.
           Show your thinking, not just the result.

The honest bit — What was harder than expected? What didn't work?
                 What are you still figuring out?

What's next — Give readers something to look forward to.

Soft CTA — Something natural: "If you want to try it, it's live at [link]"
           or "Reply and tell me if you've hit this problem too."
```

**Example hooks:**
> I spent 3 days refactoring the sync engine and the result is... exactly the same from the user's perspective. But here's why that was the most important thing I did all month.

> Mình mất 3 ngày refactor cái sync engine, kết quả nhìn bên ngoài y chang. Nhưng đây là lý do nó quan trọng nhất tháng này.

### Product Announcement (Social version)

You shipped something. Make people excited without sounding like marketing.

```
The story — Why you built this. Start with user pain or your own frustration.

What it does — Show through a scenario, not a feature list.
              "Imagine you're [doing X] and then [this happens]..."

One cool detail — The thing that makes technical people go "oh, nice."

Try it — Link + honest expectation setting.
         "It's still rough around the edges but [core thing] works great."
```

### Lesson Learned

Share a specific lesson from a specific experience. Not generic advice.

```
The situation — What happened. Be specific about the context.

What went wrong (or right) — The unexpected part.

The lesson — One clear, actionable takeaway.

How you apply it now — Concrete change in your workflow.
```

---

## REDDIT POSTS (special format)

Reddit requires a unique approach. Posts must feel like genuine community contributions, not blog promotions. The skill uses the "value-first hybrid" format: full substance in the self-post, blog link as optional further reading. Read `references/platforms/reddit.md` for the full strategy — karma rules, self-promotion limits, and subreddit targeting.

**Critical:** Always load `references/platforms/reddit.md` when writing for Reddit. The rules are strict and violating them means invisible posts or account bans.

### "I Built X" (r/SideProject, r/programming, r/webdev Showoff Saturday)

The most consistently successful format for dev content on Reddit. Tell the story of what you built.

```
Title — Specific result or achievement. Include a number if possible.
         "I built an open-source alternative to X that does Y in Z ms"
         NOT "Check out my new project!" (this gets immediately removed)

The problem — 2-3 sentences. What frustrated you? Why do existing solutions fail?
              Be specific, not generic. Redditors can smell marketing.

What I built — Walk through the solution. Show, don't tell.
               Include tech stack, architecture decisions, trade-offs.
               Code snippets (4-space indented) are expected.

The interesting technical bit — One thing that makes developers go "oh, nice."
                                This is what earns upvotes in technical subreddits.

Numbers / proof — Stats, benchmarks, user count, performance gains.
                  Concrete numbers build credibility.

What's next / open questions — Shows you're a community member, not just dropping links.
                               Ask for feedback genuinely.

---

*Full writeup with more diagrams and code on my blog: [link]*
*Repo: [GitHub link]*
```

**Title formula:** "I built [specific thing] that [specific capability] — [proof/result]"

### Technical Deep-Dive (r/programming, r/javascript, r/rust, etc.)

For sharing technical knowledge. Must be genuinely educational — the community has zero tolerance for shallow content.

```
Title — Lead with the problem or insight, not the solution.
         "How we reduced our API latency from 200ms to 15ms using [technique]"
         "TIL [specific technical insight] — here's how it works under the hood"

The context — Brief setup. What led you to this investigation?
              1-2 sentences max. Get to the meat fast.

The meat — The core technical content. Code, architecture, data.
            Use 4-space indented code blocks (not triple backticks for Old Reddit compat).
            Be thorough but not exhausting. Reddit posts should be self-contained.

The insight — What generalizes beyond your specific case?
              This is what makes the post share-worthy.

Discussion prompt — End with something that invites genuine responses.
                    "Has anyone tried a different approach to this?"
                    "I'm curious if this holds up at larger scale."

---

*I wrote a longer version with more benchmarks and edge cases: [blog link]*
```

### Lesson Learned / Postmortem (r/programming, r/devops, r/ExperiencedDevs)

Failure stories and honest reflections perform exceptionally well on Reddit. The community rewards vulnerability.

```
Title — Lead with the consequence or the surprise.
         "We accidentally deleted our production database — here's our 4-hour recovery story"
         "Why I mass-migrated away from [technology] after 2 years"

What happened — Set the scene. Be specific about the context.
                Redditors value honesty about the messy details.

The chain of events — Walk through it chronologically.
                      What failed, what made it worse, what saved it.

What we learned — Specific, actionable lessons.
                  Not generic advice. What did YOU change?

What we do differently now — Concrete process/tool/architecture change.
                             This is the value readers take away.
```

### Subreddit-specific framing

The same content needs different framing per subreddit:

| Subreddit | Framing focus | Title angle |
|-----------|--------------|-------------|
| r/programming | Technical depth, insight | Lead with the interesting algorithm/technique |
| r/SideProject | The journey, metrics | Lead with what you built and why |
| r/webdev | Practical applicability | Lead with the problem it solves |
| r/javascript (or language-specific) | Language/ecosystem relevance | Lead with the technology choice |
| r/devops | Operations/reliability | Lead with the scale/reliability challenge |
| r/selfhosted | Self-hosting angle | Lead with "open-source alternative to X" |

**Important:** When cross-posting to 2-3 subreddits, write distinct titles for each. Never copy-paste the same title across subreddits (Reddit flags this as spam).

---

## LONG POSTS (800+ words)

Long posts are for blog platforms: Substack, Medium, Hashnode, Dev.to, Ghost, Viblo.

**Diagram note:** Long posts are eligible for visual diagrams. After drafting, review the post and suggest 1-2 diagram placements where a visual would significantly improve comprehension. See `references/visual-diagrams.md` for the content-type-to-diagram mapping and generation guidelines.

### Build-in-Public Update (Long form)

Same as medium version but with more room for technical details, code snippets, and reflection.

```
Hook — Start with the most interesting thing that happened.

Context — Brief setup. Where were you before?

The meat — Walk through what you did with code snippets, screenshots, numbers.
           Show your thinking, not just the result.

The honest bit — What was harder than expected?

Technical deep-cut — One thing you learned that other developers would find useful.

What's next — Give readers something to look forward to.

Soft CTA — Natural invitation to try, follow, or discuss.
```

**Diagram opportunities:**
- "The meat" section: `flowchart` showing architecture changes or `timeline` showing project progress over the update period
- "Technical deep-cut" section: `sequenceDiagram` or `flowchart` if explaining a specific technical concept
- Place diagram after the paragraph it illustrates, not before

### Technical Deep-Dive

Explain how something works under the hood. Teach something useful while showing technical depth.

```
Hook — Start with the problem, not the solution.
       "How do you sync data across 4 devices in under 200ms?"

The problem space — Why is this hard? What are the tradeoffs?
                    Help non-experts understand the constraints.

Your approach — Walk through your solution with code snippets, diagrams,
               and concrete numbers.
               Compare to alternatives you considered.

What you learned — Technical insight that generalizes beyond your product.
                   This is what makes people share the post.

Resources — Link to relevant docs, papers, or tools you used.
            If it's open-source, link to the specific code.
```

**Key principle:** Pitch at a level where a mid-level developer follows along but a senior developer still learns something.

**Diagram opportunities (strongest candidate for visuals):**
- "Your approach" section: `flowchart TD` for architecture overview, `sequenceDiagram` for request/data flows — this is the primary diagram placement
- "The problem space" section: `flowchart LR` with subgraphs to compare your approach vs. alternatives, or a simple diagram showing why the naive approach fails
- Max 2 diagrams per post — one for the approach, optionally one for the problem space

### Product Announcement (Blog version)

```
The story — Why did you build this? Start with user pain or your own frustration.

What it does — Show, don't tell. Walk through a concrete usage scenario.

How it works (briefly) — Technical readers want a peek under the hood.

What's different — If competitors have something similar, be honest about
                   how yours differs. Honest > polished.

Try it — Natural invitation. Link to the product, app store, or repo.
```

**Tone check:** If it reads like it could be on ProductHunt, make it more personal.

**Diagram opportunities:**
- "How it works" section: simple `flowchart LR` showing the 3-5 step user journey or high-level architecture
- "What's different" section: `flowchart LR` with before/after subgraphs if comparing old way vs new way
- Keep diagrams simple here — announcements should be accessible, not intimidating

### Studio/Process Post

Share how your team works.

```
The insight — One thing you want readers to walk away knowing.

The story — Ground it in a specific moment or week.

The method — What you actually did. Tools, prompts, workflows.
             Specific enough that someone could try it themselves.

The caveat — What doesn't work? Where does this fall short?

The takeaway — One clear, memorable conclusion.
```

**Diagram opportunities:**
- "The method" section: `flowchart TD` showing the workflow or process steps — this is the natural fit for process posts
- "The story" section: `sequenceDiagram` if the story involves handoffs between team members or tools
- One diagram is usually enough for this post type

### Lesson Learned (Long form)

Same as medium version but with room for deeper analysis and technical detail.

```
The situation — What happened. Be specific about the context.
               Include enough technical detail for readers to follow.

What went wrong (or right) — The unexpected part, with specifics.

The analysis — Dig into why this happened. Root cause, contributing factors.

The lesson — One clear, actionable takeaway.

How you apply it now — Concrete change in your workflow.
                       Show the before/after of your process.
```

**Diagram opportunities:**
- "What went wrong" section: `sequenceDiagram` showing the chain of events that led to the issue
- "The analysis" section: `flowchart TD` tracing root cause to symptoms, or a decision tree showing what you'd do differently
- These diagrams help readers internalize the lesson — use them when the cause-effect chain has 3+ steps

---

## Headline formulas

Write the headline last. Draft 3-5 after the body is done.

**English formulas:**
- "I [did unexpected thing] and here's what happened"
- "How I built [specific thing] in [timeframe]"
- "Why I chose [X] over [Y]"
- "[Number] things I learned [doing thing]"
- "[Thing] is broken. Here's how I'm fixing it."
- "Building [product] with a [N]-person team: [specific lesson]"

**Vietnamese formulas:**
- "Mình đã [làm gì] trong [thời gian] — và đây là kết quả"
- "Tại sao mình chọn [X] thay vì [Y]"
- "[Số] điều mình học được khi [làm gì]"
- "Từ [vấn đề] đến [kết quả]: hành trình [thời gian]"
- "[Sản phẩm]: Câu chuyện đằng sau [feature/decision]"
- "Tản mạn: [chủ đề ngắn gọn]"

Avoid generic headlines like "Product Update #12" or "Cập nhật tuần này." Find the most interesting thing and lead with that.

---

## Adapting between sizes

When the user writes a long blog post, offer to generate shorter versions:
- **Blog → Reddit self-post**: Adapt to value-first hybrid format — full substance in the post, blog link at bottom. Convert fenced code blocks to 4-space indented. Remove inline images (link to hosted images instead). Write 2-3 subreddit-specific titles. Strip any content that reads as self-promotional.
- **Blog → Facebook medium post**: Extract the story + key insight, strip code blocks
- **Blog → Threads thread**: Break into 5-7 posts, one idea per post, hook first
- **Blog → Quick teaser**: One compelling number or result + link to full post

When the user writes a short post and wants to expand:
- **Short → Blog**: Ask what details they'd add, what code they'd show, what went wrong
- **Thread → Blog**: Stitch the thread into a narrative with added depth
- **Reddit → Blog**: Expand on code examples, add diagrams (Mermaid for supported platforms), add sections that were cut for Reddit's format
