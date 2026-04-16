# Feedback Engine: Learning How the User Writes

This reference file explains how to collect, parse, store, and apply user feedback to build a personalized voice profile over time. The goal is simple: each draft should sound more like the user than the last, until eventually most drafts need zero corrections.

## The voice profile file

Store learned preferences in `voice-profile.json` in the **data directory** (`<workspace>/.claude/dev-blog-writer/`), alongside `config.json`. The skill's own directory is read-only — never write data files there. Create `voice-profile.json` on the first feedback interaction — not during setup.

### Schema

```json
{
  "voice_profile": {
    "tone_preferences": [
      {
        "rule": "Use a more playful, less serious tone for Facebook posts",
        "source_feedback": "too formal here",
        "platform": "facebook",
        "post_type": null,
        "added": "2026-04-16"
      }
    ],
    "structural_preferences": [
      {
        "rule": "Keep intros under 2 sentences — jump into the story faster",
        "source_feedback": "the intro is too long, get to the point",
        "platform": null,
        "post_type": "build-in-public",
        "added": "2026-04-16"
      }
    ],
    "vocabulary": {
      "preferred_words": ["ship", "vibe", "ngon"],
      "avoided_words": ["utilize", "leverage", "tối ưu hóa"],
      "signature_phrases": ["nói thật là", "the thing is"]
    },
    "opening_style": "Start with a specific moment or number, not context-setting",
    "closing_style": "End with a question to readers, not a summary",
    "formatting_preferences": [
      "Prefer shorter paragraphs (1-3 sentences max)",
      "Use code blocks sparingly — only for actual code, not config examples"
    ],
    "per_platform": {
      "substack": {
        "tone_notes": [],
        "structural_notes": [],
        "vocab_notes": []
      },
      "facebook": {
        "tone_notes": [],
        "structural_notes": [],
        "vocab_notes": []
      },
      "threads": {
        "tone_notes": [],
        "structural_notes": [],
        "vocab_notes": []
      }
    }
  },
  "feedback_stats": {
    "total_drafts": 0,
    "total_approvals": 0,
    "approval_streak": 0,
    "last_interaction": null,
    "confidence_level": "learning",
    "per_context": {}
  },
  "feedback_log": []
}
```

## Collecting feedback

### When to ask

The feedback prompt appears after delivering a draft (step 7.5 in the core workflow). What you ask depends on the current confidence level for the specific context (platform + size + post type).

**`learning` level — always ask, be specific:**

> How does this feel? Anything you'd change about the tone, word choices, structure, or opening? Or is this good to go?

**`calibrated` level — ask lightly, easy to dismiss:**

> Anything to tweak, or good to go?

**`confident` level — skip the question, leave the door open:**

Don't ask for feedback. Just deliver the draft and offer to publish. Add a quiet note at the end:

> If anything feels off, just let me know and I'll adjust.

### How to determine the current context key

Build the context key from three parts: `{platform}:{size}:{post_type}`

Examples:
- `substack:long:build-in-public`
- `facebook:short:hot-take`
- `threads:short:teaser`
- `substack:long:technical-deep-dive`

Look up this key in `feedback_stats.per_context`. If it doesn't exist yet, treat it as `learning`.

## Parsing feedback

When the user responds to a feedback prompt, classify their response into one of three categories:

### 1. Substantive feedback (resets streak)

The user gives specific corrections or preferences. Typically > 50 words, or contains clear directives even if shorter ("make it less formal", "the opening is too slow", "don't use that word").

**Action:**
- Parse the feedback into one or more preference rules (see Categorizing below)
- Store each rule in the appropriate section of `voice-profile.json`
- Log the full feedback in `feedback_log`
- Reset `approval_streak` to 0 for this context
- Drop confidence one level for this context (but not below `learning`)
- Apply the feedback to a revised draft immediately

### 2. Minor adjustment (streak holds)

The user gives brief, low-effort feedback — a small tweak, not a pattern change. Typically 10-50 words, and the correction is about this specific post, not a general preference. Examples: "change the title", "add a link at the end", "swap paragraphs 2 and 3".

**Action:**
- Apply the change to the draft
- Log it in `feedback_log` but do NOT store as a voice profile rule
- Keep the current streak (don't increment, don't reset)
- Confidence level stays the same

### 3. Approval (increments streak)

The user says some variant of "looks good", "ship it", "perfect", "go ahead", "ok", "lgtm", or gives empty/no feedback. Typically < 10 words with no specific corrections.

**Action:**
- Log the approval in `feedback_log`
- Increment `approval_streak` by 1 for this context
- Recalculate confidence level for this context
- Proceed to publishing flow

### Distinguishing "minor adjustment" from "substantive feedback"

This is a judgment call. The key question is: **does this feedback reveal a preference that should apply to future posts?**

- "Move the CTA to the end" → minor adjustment (structural choice for this post)
- "I always want the CTA at the end" → substantive feedback (general preference)
- "Change 'leverage' to 'use'" → could be either. If the user seems annoyed by the word, it's substantive. If it's just a one-off swap, it's minor.

When in doubt, lean toward treating it as substantive — better to learn too much than too little.

## Categorizing feedback into preference rules

When you identify substantive feedback, extract rules and place them in the right bucket:

| Feedback about... | Store in... | Example |
|---|---|---|
| How formal/casual/playful the writing sounds | `tone_preferences` | "too stiff for Facebook" |
| Sentence length, paragraph structure, section order | `structural_preferences` | "shorter intros" |
| Specific words to use or avoid | `vocabulary.preferred_words` or `vocabulary.avoided_words` | "don't say 'utilize'" |
| Recurring phrases the user likes | `vocabulary.signature_phrases` | "I always say 'nói thật là'" |
| How posts start | `opening_style` | "jump into the story" |
| How posts end | `closing_style` | "end with a question" |
| Markdown, code blocks, emoji, formatting | `formatting_preferences` | "less emoji" |

If the feedback is platform-specific, also store it under `per_platform.{platform}`.

### Rule format

Each rule should be actionable, sourced, and scoped:

```json
{
  "rule": "Use shorter, punchier sentences in Facebook posts — max 15 words per sentence",
  "source_feedback": "these sentences are too long for facebook, make them snappier",
  "platform": "facebook",
  "post_type": null,
  "added": "2026-04-16"
}
```

- **Actionable**: written as an instruction you can follow next time
- **Sourced**: includes the original feedback so you can trace why the rule exists
- **Scoped**: tagged with platform and/or post_type if context-specific, or null if universal

## Confidence levels and transitions

### Level definitions

| Level | Meaning | Feedback behavior |
|---|---|---|
| `learning` | Still figuring out the user's voice | Ask detailed feedback after every draft |
| `calibrated` | Good understanding, still checking | Ask light feedback ("anything to tweak?") |
| `confident` | Reliably writing in the user's voice | Skip feedback, deliver + offer publish |

### Climbing up (earning trust)

| From | To | Condition |
|---|---|---|
| `learning` | `calibrated` | 4+ consecutive approvals in this context, AND at least 5 total drafts overall |
| `calibrated` | `confident` | 8+ consecutive approvals in this context, OR 80%+ approval rate over last 15 drafts in this context |

**Shortcut via feedback density:** If the user's average feedback length has been declining over the last 5 interactions (going from paragraphs to "looks good"), bump up one level even if the streak threshold hasn't been met. This catches the pattern where users gradually stop giving feedback because the drafts are already good enough.

To measure this: look at the last 5 entries in `feedback_log` for this context. If 4 out of 5 have `feedback_word_count` < 10, that's a density signal to promote.

### Dropping down (when things change)

| Trigger | Action |
|---|---|
| Substantive feedback at any level | Reset streak to 0, drop one level for this context |
| New platform the user hasn't used much (< 3 drafts) | Start at `learning` for that platform context |
| New post type the user hasn't done before | Start at `learning` for that post type context |
| 30+ days since last interaction | Drop one level across all contexts (staleness decay) |

### Handling feedback at `confident` level — the override question

When a user at `confident` level gives substantive feedback, it could mean they've changed their general preference, or this particular post needs something different. Ask:

> Got it — should I treat this as your new default going forward, or just for this post?

**"Just this post"** → Apply changes to this draft only. Don't update `voice-profile.json`. Don't reset the streak. Confidence stays where it is. Think of it as a temporary override.

**"Going forward"** → Update the voice profile with the new preference. Reset streak for this context. Drop to `calibrated` (not `learning` — the user has already proven they don't need hand-holding for everything else).

**User doesn't clarify** → Default to updating the profile and dropping to `calibrated`. If someone at `confident` level volunteers feedback, it's probably a real shift.

## Applying the voice profile

At the start of every writing session, after loading `config.json`, also load `voice-profile.json` (if it exists). Before writing any draft:

1. Read all universal rules (those with `platform: null` and `post_type: null`)
2. Read platform-specific rules matching the target platform
3. Read post-type-specific rules matching the target post type
4. Read the `per_platform` notes for the target platform
5. Check vocabulary lists — use preferred words, avoid avoided words, work in signature phrases where natural
6. Apply opening and closing style preferences
7. Apply formatting preferences

These preferences layer on top of (and can override) the general voice principles in SKILL.md and anti-ai-voice.md. If a learned preference contradicts a default guideline, the learned preference wins — the user's actual voice trumps generic best practices.

## Consolidation

Over time, the voice profile can accumulate redundant or contradictory rules. After every 10th approval (when `total_approvals % 10 == 0`), do a quick consolidation pass:

1. **Merge similar rules**: "shorter intros" and "get to the point faster in openings" → single rule
2. **Resolve contradictions**: newer rules win. Remove the older conflicting rule.
3. **Prune stale rules**: if a rule hasn't been relevant in 20+ drafts and was based on a single feedback, consider removing it (but don't remove rules the user explicitly emphasized)
4. **Update vocabulary lists**: deduplicate, alphabetize

## The feedback log

Every interaction gets logged in `feedback_log`, regardless of category. This is the raw history that powers the adaptive system.

```json
{
  "timestamp": "2026-04-16T14:30:00Z",
  "context_key": "substack:long:build-in-public",
  "draft_number": 1,
  "feedback_category": "approval",
  "feedback_text": "looks good, ship it",
  "feedback_word_count": 4,
  "rules_extracted": [],
  "confidence_before": "calibrated",
  "confidence_after": "calibrated",
  "streak_before": 5,
  "streak_after": 6
}
```

Keep the log as an append-only array. It's the source of truth for calculating feedback density trends and approval rates.
