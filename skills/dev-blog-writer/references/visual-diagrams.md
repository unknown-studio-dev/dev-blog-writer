# Visual Diagrams

Generate Mermaid diagrams to visually explain key sections of blog posts. Diagrams help readers grasp architecture, flows, and processes faster than prose alone — but only when they add clarity, not decoration.

## When to generate diagrams

**Proactively suggest (long posts only, 800+ words):**
- Identify 1-2 sections where a diagram would significantly improve comprehension
- Suggest the diagram type and placement to the user before generating
- Phrasing: *"This section about [topic] would benefit from a [type] diagram — want me to add one?"*

**On request (any post size):**
- Generate when the user explicitly asks for a visual or diagram
- For medium posts: keep diagrams simple (under 8 nodes/steps)
- For short posts: generally discourage — diagrams get compressed and unreadable on social platforms. Offer only if the user insists.

**Never generate diagrams for:**
- Emotional or storytelling sections (the honest bit, personal reflections)
- Sections that are already clear in 2-3 sentences
- Posts where the diagram would be the only visual and would look out of place

## Content-type to diagram-type mapping

Pick the diagram type that best fits the content. These are defaults — adapt to the specific section being illustrated.

### Technical Deep-Dive

| Section | Diagram type | Use when |
|---------|-------------|----------|
| System architecture | `flowchart TD` or `flowchart LR` | Showing components and how they connect |
| Request/data flow | `sequenceDiagram` | Showing how data moves between services or components step by step |
| Decision logic | `flowchart TD` with decision nodes | Explaining branching logic or algorithm flow |
| State management | `stateDiagram-v2` | Showing states an entity can be in and transitions |
| Comparison (your approach vs alternatives) | `flowchart LR` with subgraphs | Side-by-side comparison of two approaches |

### Build-in-Public Update

| Section | Diagram type | Use when |
|---------|-------------|----------|
| Progress / timeline | `timeline` | Showing what happened over days or weeks |
| Architecture changes | `flowchart` with before/after subgraphs | Showing what changed in the system |
| Feature relationships | `flowchart LR` | Showing how new features connect to existing ones |

### Studio / Process Post

| Section | Diagram type | Use when |
|---------|-------------|----------|
| Workflow | `flowchart TD` | Showing step-by-step process |
| Team collaboration | `sequenceDiagram` | Showing handoffs between roles or tools |
| Decision framework | `flowchart TD` with diamond nodes | Showing how decisions are made |

### Product Announcement

| Section | Diagram type | Use when |
|---------|-------------|----------|
| How it works (overview) | `flowchart LR` | Simple 3-5 step user journey |
| Architecture peek | `flowchart TD` | Under-the-hood view for technical readers |
| Before/after | `flowchart LR` with subgraphs | Old way vs new way |

### Lesson Learned

| Section | Diagram type | Use when |
|---------|-------------|----------|
| What went wrong | `sequenceDiagram` | Showing the chain of events that caused the issue |
| Cause and effect | `flowchart TD` | Tracing root cause to symptoms |
| Decision tree | `flowchart TD` with diamonds | The decision points and what you'd do differently |

## Mermaid syntax guidelines

### Keep it simple

- **Max 12 nodes** per diagram. If you need more, split into multiple diagrams or simplify.
- **Max 3 levels deep** for flowcharts. Deeper nesting makes the diagram unreadable.
- **Short labels.** Node labels should be 1-5 words. Move details to the prose.
- **Meaningful IDs.** Use `API`, `DB`, `Client` — not `A`, `B`, `C`.

### Layout direction

- `flowchart LR` (left-to-right): for data flows, pipelines, before/after
- `flowchart TD` (top-down): for hierarchies, decision trees, process steps
- `sequenceDiagram`: for time-ordered interactions between actors
- `stateDiagram-v2`: for lifecycle/state changes
- `timeline`: for chronological progress

### Styling

Keep default Mermaid styling. Don't add custom CSS or theme overrides — they break across platforms. Use subgraphs for visual grouping instead.

```
flowchart LR
  subgraph Input
    A[Upload File] --> B[Validate]
  end
  subgraph Processing
    B --> C[Parse] --> D[Transform]
  end
  subgraph Output
    D --> E[Store] --> F[Notify User]
  end
```

### Common patterns

**Architecture overview:**
```
flowchart TD
  Client[Mobile App] --> API[API Gateway]
  API --> Auth[Auth Service]
  API --> Core[Core Service]
  Core --> DB[(PostgreSQL)]
  Core --> Cache[(Redis)]
  Core --> Queue[Message Queue]
  Queue --> Worker[Background Worker]
```

**Sequence flow:**
```
sequenceDiagram
  participant U as User
  participant A as API
  participant D as Database
  U->>A: POST /upload
  A->>A: Validate file
  A->>D: Store metadata
  D-->>A: OK
  A-->>U: 200 + upload URL
```

**Before/after comparison:**
```
flowchart LR
  subgraph Before
    A1[Client] --> B1[Monolith] --> C1[Single DB]
  end
  subgraph After
    A2[Client] --> B2[API Gateway]
    B2 --> C2[Auth Service]
    B2 --> D2[Core Service]
    C2 --> E2[(Auth DB)]
    D2 --> F2[(Core DB)]
  end
```

**Timeline:**
```
timeline
  title Project Journey
  Week 1 : Research & prototyping
         : Chose tech stack
  Week 2 : Core API built
         : First deploy to staging
  Week 3 : Beta launch
         : 50 users onboarded
```

## Language handling

Diagram labels follow the same language rules as the post body:

- **English posts:** All labels in English.
- **Vietnamese posts:** Labels in Vietnamese, but **keep technical terms in English**. This matches the natural code-switching the skill already uses in prose.
  - Good: `User` -> `Xử lý file` -> `Lưu vào DB`
  - Bad: `Người dùng` -> `Xử lý tập tin` -> `Lưu vào cơ sở dữ liệu`
- **Mixed posts:** Same as Vietnamese — use the most natural label for each node.

**Participant/actor names** in sequence diagrams should always be short and clear:
- English: `User`, `API`, `DB`, `Worker`
- Vietnamese: `User`, `API`, `DB`, `Worker` (keep these in English — they're universal)

## Diagram placement in posts

Place diagrams **immediately after the paragraph they illustrate**, not before. The prose introduces the concept, the diagram reinforces it.

```markdown
The sync engine works by first checking the local cache, then falling
back to the API if the data is stale. Here's how the pieces fit together:

[DIAGRAM HERE]

The key insight is that the cache check happens in under 5ms...
```

For technical deep-dives, the ideal placement is:
1. First diagram: in "Your approach" section — architecture or flow overview
2. Second diagram (optional): in "The problem space" — showing why the naive approach doesn't work, or comparing alternatives

For build-in-public updates:
1. One diagram max — either in "The meat" section (architecture change) or as a timeline for progress

## Output format

How the diagram is delivered depends on the target platform. See `references/platform-diagram-support.md` for the full rendering matrix.

**Platforms with native Mermaid (Dev.to, Hashnode, Viblo):**
- Embed the Mermaid code block directly in the post markdown:
  ````markdown
  ```mermaid
  flowchart LR
    A[Input] --> B[Process] --> C[Output]
  ```
  ````

**Platforms without native Mermaid (Medium, Substack, Ghost, Facebook, Threads):**
- Render the diagram to PNG using the Mermaid MCP tool (`validate_and_render_mermaid_diagram`) or `@mermaid-js/mermaid-cli` (`mmdc`)
- Save the PNG alongside the post markdown as a separate file
- Reference it in the markdown: `![Diagram description](./diagram-name.png)`
- Always keep the Mermaid source as a code comment or companion `.mermaid` file so the user can edit later

**File naming convention:**
- `{post-slug}-diagram-{n}.png` — e.g., `sync-engine-deep-dive-diagram-1.png`
- `{post-slug}-diagram-{n}.mermaid` — source file (optional, for editability)

**Cross-platform bundles:**
When generating versions for multiple platforms, use native Mermaid for platforms that support it and PNG for the rest. Don't generate PNGs unnecessarily.

## Mermaid rendering tools

The skill uses the **Mermaid MCP tool** (`validate_and_render_mermaid_diagram`) as the primary rendering method. This tool validates syntax and renders the diagram to a visual widget.

**If the Mermaid MCP tool is not available:**
1. Generate the Mermaid source code and embed it in the markdown (works for Dev.to, Hashnode, Viblo)
2. For platforms needing PNG: inform the user that automatic rendering isn't available, and suggest either:
   - Installing the Mermaid rendering tool for automatic PNG conversion
   - Using [Mermaid Live Editor](https://mermaid.live) to manually export PNG
   - Installing `@mermaid-js/mermaid-cli` locally: `npm install -g @mermaid-js/mermaid-cli` then `mmdc -i diagram.mmd -o diagram.png`

## Quality checklist

Before delivering a diagram, verify:

- [ ] Does the diagram actually help understanding, or is it just decoration?
- [ ] Are labels short (1-5 words) and accurate?
- [ ] Is the flow direction logical (left-to-right for flows, top-down for hierarchies)?
- [ ] Are there 12 or fewer nodes?
- [ ] Does the language match the post (with natural code-switching for Vietnamese)?
- [ ] Is the diagram placed after the paragraph it illustrates?
- [ ] Is the correct format used for the target platform (Mermaid code block or PNG)?
