# Ghost Formatting Guide

## Key features to use

**Custom themes:** Ghost supports full theme customization. Posts render within the user's chosen theme, so formatting consistency matters. Stick to standard markdown (H2/H3, bold, code blocks, images) that any Ghost theme handles well.

**Cards:** Ghost's editor uses a card system. Key cards to leverage:
- **Markdown card** — write in raw markdown within the editor
- **Code card** — syntax-highlighted code blocks (specify language)
- **Image card** — full-width, wide, or regular sizing
- **Bookmark card** — rich link previews with title, description, and thumbnail
- **Toggle card** — collapsible sections for supplementary detail
- **Callout card** — highlighted info/warning/tip boxes

**Excerpt:** Ghost uses the first paragraph or a custom excerpt for previews and SEO. Make the opening strong.

**Feature image:** Displayed prominently at the top of posts and in post listings. Include one for better visual presence.

**Canonical URL:** If cross-posting from another platform, set the canonical URL in Ghost's post settings.

## Ghost-specific strengths

**Self-hosted control:** Ghost users own their audience data, email list, and content. Posts are part of a larger publication strategy — not just standalone content.

**Membership & newsletters:** Ghost combines blog + email newsletter. The post IS the email. Write with both reading contexts in mind (web vs. inbox).

**SEO:** Ghost generates clean, fast pages with good default SEO. Use meta title and description fields for search optimization.

**Internal tags:** Use internal tags (prefixed with `#`) for organization without displaying to readers.

**Code injection:** Ghost allows per-post code injection (header/footer). This enables Mermaid.js rendering if the user has added the Mermaid script to their site — see `references/platform-diagram-support.md`.

## What to avoid on Ghost

- Don't rely on complex HTML embeds (they work but can break across theme updates)
- Don't skip the excerpt/meta description (Ghost uses it for SEO and social cards)
- Don't use tables heavily (rendering varies by theme)
- Don't forget that posts are also emails — avoid elements that break in email clients (complex layouts, wide code blocks, interactive elements)
- Don't use more than 3-4 tags (Ghost uses primary tag for URL routing in most themes)

## Mermaid diagram support

Ghost does NOT render Mermaid code blocks natively. However, if the user has added Mermaid.js to their site via code injection, Mermaid code blocks will render.

- Default: render diagrams as PNG images
- If the user confirms Ghost-side Mermaid support: embed Mermaid code blocks directly
- Store this preference in config under `platform.ghost_mermaid_support: true`

## Output structure for Ghost

```markdown
# Headline Here

*Subtitle or lead-in*

![Feature image description](placeholder-for-feature-image)

[Body with H2/H3 sections, code blocks with language hints, images]

---

**Alternative headlines:**
1. Option A
2. Option B
3. Option C

**Suggested Ghost tags:** tag1, tag2, tag3
**Primary tag (for URL routing):** tag1
```
