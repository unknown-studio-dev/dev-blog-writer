# Writing Like a Human, Not a Machine

Readers can smell AI-written content instantly. It kills trust. These are the specific patterns to catch and fix — for both English and Vietnamese writing.

## UNIVERSAL PATTERNS (both languages)

### The em dash problem

Never use em dashes (—) to connect clauses mid-sentence. This is the single biggest AI tell. "The system was fast — blazingly fast — and it worked" is a dead giveaway. Use commas, periods, or rewrite the sentence. One dash per post maximum, and only if it genuinely fits.

### Paragraph uniformity

AI produces paragraphs that are all roughly the same length (3-4 sentences, ~60-80 words each). Real humans don't write that way.

Mix it up deliberately. Write a one-sentence paragraph. Then a six-sentence one. Then two sentences.

Like this.

Then maybe a longer block where you get into the details of something and it takes a few more sentences to explain because the idea is complex enough that it needs room to breathe, and you're not trying to hit some invisible word count target.

### Bullet point overuse

AI loves neat, parallel bullet points with 5-10 word fragments. Every item the same grammatical structure, the same length. This looks robotic.

When you need a list, vary the item lengths. Better yet, weave the information into sentences: "We needed caching, a new API layer, and honestly the database migration was an afterthought that turned out to matter most."

If you must use bullets, make some items one line and others three lines. Break the pattern.

### Vague sweeping endings

AI often closes paragraphs with hollow wrap-ups: "And that's what makes this approach so powerful" or "This is where the real magic happens." These are filler.

End with a specific detail, a number, a question, or just stop when you've made your point. The reader doesn't need a bow on every section.

### Show genuine emotion

Real people get excited about what they build! They say "It actually worked!" or "I couldn't believe the latency numbers." A well-placed "!" conveys authenticity that polished prose can't.

Don't overdo it (one per few paragraphs is fine), but don't strip all emotion out either. Frustration, surprise, pride, uncertainty. Let them through.

### Include imperfect details

Mention that you wrote the code at 2am. That you were eating lunch when the idea hit. That you accidentally pushed to main. That the first version was embarrassingly bad.

These messy, specific, human details are what make readers trust you. AI doesn't invent them. You lived them.

### Sentence rhythm

Mix sentence lengths deliberately. A short one. Then a longer one that takes its time getting to the point because you're working through a thought. Then medium. Then short again.

Read your draft out loud. If every sentence is roughly the same length, rewrite until they're not.

### Words and phrases to avoid (English)

These show up too often in AI writing and rarely in human dev blogs:

- "landscape" (as in "the AI landscape")
- "leverage" (just say "use")
- "paradigm", "synergy", "ecosystem" (unless genuinely technical)
- "In today's [anything]..." as an opener
- "Let's dive in" or "Let's explore"
- "It's worth noting that..."
- "At the end of the day..."
- "This is a game-changer"
- "Streamline" (say what actually gets faster or simpler)

---

## VIETNAMESE-SPECIFIC PATTERNS

Vietnamese AI text has its own distinct tells. Vietnamese readers in tech communities are increasingly trained to spot these. Getting caught using AI without adding real value is a community trust killer.

### Over-formal language

The biggest Vietnamese AI tell. AI defaults to textbook Vietnamese that nobody in dev communities actually uses.

**AI tendency:** "Điều đáng lưu ý là công nghệ này mang lại nhiều lợi ích đáng kể."
**Real Vietnamese:** "Chú ý cái này nha — mình thấy nó hay ở chỗ..."

**AI tendency:** "Chúng tôi đã triển khai giải pháp này để tối ưu hóa hiệu suất."
**Real Vietnamese:** "Bọn mình deploy xong, performance tăng đáng kể!"

**AI tendency:** "Bài viết này sẽ giải thích chi tiết các nguyên lý cơ bản."
**Real Vietnamese:** "Bài này mình sẽ đi sâu từ first principles, đọc xong hi vọng mọi người sẽ hiểu."

The fix: Write like you're explaining to a friend at a café. Use "mình", use casual connectors, keep English tech terms as-is.

### Missing emotional particles

Vietnamese is a particle-heavy language. Real writers sprinkle "nha", "á", "luôn", "ha", "nè" throughout their writing. AI almost never uses these.

**AI:** "Thử cách này."
**Real:** "Thử cách này nha."

**AI:** "Kết quả rất tốt."
**Real:** "Kết quả ngon lắm luôn!"

**AI:** "Mình muốn chia sẻ một điều."
**Real:** "Nè, mình mới phát hiện cái này."

The fix: After drafting, scan for particle-less sentences and add the right particles. They soften tone and signal authenticity.

### Unnatural code-switching

AI either translates everything to Vietnamese (over-translating) or keeps too much English (under-translating). Real Vietnamese devs have a natural rhythm.

**Over-translated (AI tell):** "Mình đã triển khai chức năng mới lên môi trường sản xuất."
**Natural:** "Mình đã deploy feature mới lên production."

**Under-translated (also AI tell):** "I implemented the new feature and deployed it."
**Natural:** "Mình vừa implement xong cái feature mới, deploy lên production rồi."

The fix: Keep technical terms in English. Write process/narrative in Vietnamese. Match how Vietnamese devs actually talk about code.

### Lack of storytelling / "Tản mạn" style

AI jumps straight to explanations. Vietnamese dev writing starts with a story, a moment, or a relatable situation. The "Tản mạn:" (casual rambling) format is beloved in Vietnamese tech communities.

**AI pattern:** "Bài viết này sẽ trình bày về cách tối ưu database queries."
**Real pattern:** "Tản mạn: Hôm qua mình đang ngồi ăn bún bò thì nhận notification — production DB CPU lên 98%. Bỏ bát bún chạy về..."

The fix: Start with a specific moment. Ground the reader in a scene before jumping to the technical content.

### Over-explanation of obvious concepts

AI explains things Vietnamese devs already know. In a community post, you don't need to define what an API is or explain basic concepts unless that's literally the point of the post.

**AI:** "API, viết tắt của Application Programming Interface, là một giao diện cho phép các ứng dụng giao tiếp với nhau."
**Real:** "Cái API này mình design theo REST, nhưng đang tính chuyển sang GraphQL."

The fix: Assume your reader has context. Vietnamese dev communities are tight-knit — shared knowledge is high. Jump to the interesting part.

### Robotic transitions

**AI transitions to avoid in Vietnamese:**
- "Để tóm tắt..." (To summarize...)
- "Tiếp theo, chúng ta sẽ..." (Next, we will...)
- "Một điều quan trọng cần nhớ là..." (An important thing to remember is...)
- "Như đã đề cập ở trên..." (As mentioned above...)
- "Trong bối cảnh hiện nay..." (In today's context...)

**Natural Vietnamese transitions:**
- "Nói kiểu cho dễ nhớ:" (Put simply:)
- "Cái hay ở đây là..." (The cool part is...)
- "Nhưng mà..." (But then...)
- "Rồi mình mới nhận ra..." (Then I realized...)
- Just start the next thought. No transition needed.

### Missing regional flavor

AI produces "neutral" Vietnamese that sounds like it comes from nowhere. Real Vietnamese writers have regional personality, even if subtle.

The fix: If the config specifies Southern style, use "anh em", "ngon", "vãi", "nè". If Northern, it's OK to be slightly more measured but still personal. Don't write in a regionless vacuum.

### Words and phrases to avoid (Vietnamese)

These are AI tells in Vietnamese tech writing:

- "Trong bối cảnh..." (In the context of...)
- "Đáng chú ý là..." (It's noteworthy that...)
- "Không thể phủ nhận rằng..." (It cannot be denied that...)
- "Tóm lại" at the end of every section (In summary)
- "Công nghệ tiên tiến" (advanced technology) — be specific
- "Giải pháp toàn diện" (comprehensive solution) — say what it actually does
- "Nâng cao hiệu suất" (enhance performance) — give numbers instead
- "Xu hướng công nghệ" (technology trend) — name the actual thing

---

## THE FINAL CHECK

Before delivering any draft, scan it for:

1. Em dash count (target: 0-1 per post)
2. Paragraph length variance (are there both 1-sentence and 5+ sentence paragraphs?)
3. At least 2-3 genuine emotional reactions (!, frustration, excitement)
4. No section ends with a vague sweeping statement
5. At least one imperfect/messy human detail
6. No more than one bullet-point list per 500 words

**Additional checks for Vietnamese content:**
7. Emotional particles present ("nha", "á", "luôn", "nè" — at least 2-3 per post)
8. Code-switching feels natural (tech terms in English, narrative in Vietnamese)
9. No over-formal constructions (scan for "chúng tôi", "triển khai", "giải pháp")
10. Opens with story/personal moment, not with definition/explanation
11. "Mình" used as default first-person (not "tôi" unless formal context)
12. At least one Vietnamese interjection ("trời ơi", "ủa", "vãi", "mệt")
