# Vietnamese Writing Voice Guide

Vietnamese tech writing is fundamentally different from English. It's warmer, more personal, more emotional. Vietnamese readers expect storytelling, vulnerability, and a sense of shared journey. The writing should feel like a friend sharing what they learned over coffee, not a professor giving a lecture.

## The "mình" principle

Vietnamese dev writing revolves around "mình" (I/we, inclusive). It's the default first-person that makes the reader feel included. Use "mình" in almost all casual writing. Reserve "tôi" (I, formal) only for very formal contexts.

**Natural patterns:**
- "Mình vừa ship xong feature mới" (I just shipped a new feature)
- "Hôm nay mình muốn chia sẻ..." (Today I want to share...)
- "Mình thấy cách này hiệu quả hơn" (I find this approach more effective)

For teams, use "bọn mình" (we, our team) or "team mình":
- "Bọn mình đã mất 2 tuần để fix cái bug này" (Our team spent 2 weeks fixing this bug)

Address readers as "anh em" (guys/buddies, casual) in Facebook/community posts, or "mọi người" (everyone) for a slightly wider audience. "Các bạn" is more formal and feels distant in dev communities.

## Emotional expression — the heart of Vietnamese writing

Vietnamese writing lives and dies by its emotional authenticity. Where English dev blogs might say "This was challenging," Vietnamese goes full emotional:

**Interjections that bring posts alive:**
- **"Trời ơi"** (oh my god) — genuine astonishment: "Trời ơi, latency giảm từ 2s xuống 50ms!"
- **"Ủa"** (wait/huh) — confusion or realization: "Ủa, sao nó lại chạy được?"
- **"Vãi"** (wow/damn) — strong emphasis (casual/slang): "Performance vãi luôn!"
- **"Ôi"** — soft exclamation: "Ôi, cái bug này mình tìm 3 ngày"
- **"Đỉnh thật"** (so peak/so good) — genuine admiration
- **"Mệt"** (tired/exhausted) — shared frustration: "Mệt, rất mệt 😆"
- **"Ngon"** (delicious/smooth) — something that works well: "Code chạy ngon lành!"

**Emotional rhythm:**
Vietnamese posts should oscillate between frustration, excitement, humor, and reflection. Don't maintain one flat emotional tone. A good Vietnamese post might go: excited hook → problem/frustration → determination → solution/relief → reflection.

Example flow:
> "Mình vừa ship xong cái sync engine mới. Trời ơi, nó chạy ngon lắm! Nhưng 3 ngày trước thì khác hoàn toàn. Mình ngồi debug từ 11 giờ đêm đến 3 giờ sáng, mệt muốn khóc. Cuối cùng phát hiện ra cái race condition nằm ở chỗ không ai ngờ..."

## Code-switching — Vietnamese + English tech terms

Vietnamese developers naturally mix languages. This is not laziness; it's efficiency. The community has established norms about what stays English and what gets translated.

**Always keep in English:**
- Framework/library names: React, Laravel, Node.js, Claude
- Technical operations: deploy, commit, push, merge, debug, refactor
- Architecture terms: API, REST, GraphQL, microservice, serverless
- Data concepts: database, cache, queue, pipeline
- Dev culture: PR, code review, standup, sprint
- Specific tools: Docker, Kubernetes, GitHub, VS Code

**Naturally in Vietnamese:**
- Process descriptions: "viết code" (write code), "chạy test" (run tests), "sửa bug" (fix bug)
- Explanations: "cách hoạt động" (how it works), "vấn đề" (problem)
- Opinions: "mình thấy" (I think), "theo kinh nghiệm" (in my experience)

**Natural code-switching examples:**
- "Mình đã implement cái feature này bằng React hooks" ✓
- "Deploy lên production xong thì mới phát hiện bug" ✓
- "Cái API này mình design theo REST, nhưng sau chuyển sang GraphQL" ✓
- "Refactor xong, code sạch hơn nhiều" ✓

**Unnatural (avoid):**
- "Mình đã triển khai chức năng này sử dụng React hooks" ✗ (overly translated)
- "Triển khai lên môi trường sản xuất" ✗ (nobody says this)

## Storytelling structure — "Tản mạn" style

Vietnamese tech posts often open with "Tản mạn:" (Rambling/casual chat) or a personal narrative. This is a beloved format in Vietnamese dev communities. The structure is:

1. **Personal hook** — A specific moment, frustration, or discovery
2. **Context** — Brief setup, what you were trying to do
3. **The journey** — Walk through what happened, with emotional beats
4. **The insight** — What you learned or built
5. **Reflection** — Honest takeaway, what you're still figuring out

Vietnamese readers value the journey more than the destination. Don't skip to the solution. Let them feel the struggle with you.

## Tone levels for different platforms

### Facebook Groups / Threads (Very casual)
- Heavy use of "anh em", emoji, interjections
- Short paragraphs, frequent line breaks
- Questions to spark engagement: "Anh em đã gặp case này chưa?"
- Humor and self-deprecation welcomed
- Slang OK: "ngon", "vãi", "đỉnh", "tạch" (crashed/failed)

### Blog posts — Substack/Medium/Viblo (Semi-casual)
- "Mình" as default, storytelling structure
- Emoji used sparingly (1-3 per section max)
- Technical depth expected but explained conversationally
- Metaphors encouraged: "nó như cái ổ khóa" (it's like a lock)
- Longer paragraphs OK, but still vary lengths

### Technical deep-dives (Semi-formal)
- Can use "chúng ta" (we, formal inclusive) alongside "mình"
- Less emoji, more code blocks
- Still personal voice, but more structured
- Technical Vietnamese terms OK where standard: "thuật toán" (algorithm), "cấu trúc dữ liệu" (data structure)

## Regional flavor

Vietnamese dev communities span North and South, each with distinct flavor:

**Northern style (Hà Nội):**
- Slightly more structured
- "Các bạn" sometimes used alongside "anh em"
- More measured emotional expression
- Example: "Hôm nay mình muốn chia sẻ với các bạn về cách..."

**Southern style (Sài Gòn / TP.HCM):**
- More casual, more rambling
- "Anh em" strongly preferred
- Bigger emotional swings, more humor
- Example: "Nè anh em, hôm qua mình vừa phát hiện cái hay..."

Default to Southern style for Facebook/Threads (it's more engaging). For blog posts, a neutral-leaning-Southern tone works best for the widest audience.

## Sentence particles and connectors

Vietnamese uses particles to soften, emphasize, or add nuance. These are essential for natural writing:

- **"nha/nhé"** — soft suggestion: "Thử cách này nha" (Try this way, ok?)
- **"nè"** — attention-getter: "Nè, mình mới tìm ra cái này" (Hey, I just found this)
- **"luôn"** — emphasis/immediately: "Nó chạy nhanh luôn!" (It runs fast, like wow!)
- **"á"** — casual emphasis: "Cái bug đó khó tìm lắm á" (That bug was really hard to find)
- **"ha/hả"** — question tag: "Anh em thấy sao ha?" (What do you guys think?)
- **"đó"** — pointing/emphasis: "Cái feature mình nói hôm trước đó" (That feature I mentioned before)

## Vietnamese-specific formatting

- **Line breaks matter more than headers** in social media. Vietnamese readers scan by line breaks, not by H2s.
- **Emoji as tone markers**, not decoration: 😆 (lighthearted/self-deprecating), 🔥 (exciting), ✨ (highlight), 💡 (insight), 😤 (frustration)
- **Numbered lists** for steps/processes are fine, but narrative is preferred for opinions/stories
- **Bold for emphasis** works, but use sparingly — Vietnamese readers find excessive bold aggressive
- **Quotes/blockquotes** for key takeaways or memorable lines

## Common Vietnamese tech phrases

These show up constantly in authentic Vietnamese dev writing:

- "Chạy ngon lành" — runs smoothly
- "Fix được rồi" — managed to fix it
- "Tạch rồi" — it crashed/broke
- "Code đại" — code carelessly/quick and dirty
- "Review lại" — review again
- "Ship thôi" — let's ship it
- "Chưa optimize" — not optimized yet
- "Bị stuck" — got stuck
- "Mình đang research" — I'm researching
- "Có ai biết cách..." — does anyone know how to...
