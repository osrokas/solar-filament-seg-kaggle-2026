---
name: scientific-markdown-editor
description: "Rewrite a specified Markdown file in a more scientific and representative style. Use for reports, READMEs, experiment notes, and findings that need objective tone, explicit evidence boundaries, uncertainty language, and representativeness checks. Triggers: scientific writing, data scientist editor, improve rigor, reduce hype, add limitations, bias, external validity."
argument-hint: "Path to markdown file and optional strictness: light|moderate|strong"
user-invocable: true
---

# Scientific Markdown Editor (Data Scientist)

## Outcome
Produce a revised Markdown document that is more:
- scientific (objective, evidence-linked, calibrated claims)
- representative (explicit population/sampling limits and subgroup considerations)
- reproducible (method/metric clarity)

## Inputs
- Required:
  - Markdown file path to edit
- Optional:
  - Target audience (researchers, engineers, stakeholders)
  - Strictness: `light`, `moderate`, `strong`
  - Keep structure fixed: `true|false`

## Defaults
- Scope: workspace skill in this repository
- Edit mode: in-place file edits
- Evidence policy: insert inline markers for unsupported claims

## Procedure
1. Read the target Markdown file and map its structure.
2. Extract and label major statements as:
   - observation (data-backed)
   - interpretation (inference)
   - speculation (future possibility)
3. Rewrite for scientific tone:
   - replace vague language with measurable wording
   - avoid absolute certainty unless explicitly supported
   - separate evidence from interpretation in different sentences
4. Run representativeness pass:
   - identify missing subgroup or sampling details
   - add concise notes on potential selection bias and generalization limits
   - do not invent evidence; mark gaps explicitly
5. Improve method and metric clarity:
   - define metrics, units, and directionality (higher/lower is better)
   - state evaluation context and baseline references when available
6. Add or strengthen limitations and uncertainty section:
   - data quality, sample size, confounding factors, temporal drift
7. Preserve Markdown integrity:
   - keep valid headings, tables, links, and code fences
   - keep existing meaning unless unsupported wording must be calibrated

## Decision Logic
- If evidence is absent for a strong claim:
  - downgrade claim strength
  - add a clear evidence-gap marker: `[Needs Evidence: <what data is needed>]`
- If strictness is `light`:
  - only sentence-level edits and minimal restructuring
- If strictness is `strong`:
  - allow section reordering to separate methods/results/limitations clearly
- If audience is non-technical:
  - keep rigor, but define terms in plain language

## Quality Checks
- No fabricated numbers, citations, datasets, or results
- Each major claim maps to evidence, interpretation, or speculation
- Limitations and representativeness caveats are explicit
- Uncertainty is communicated with calibrated wording
- Markdown remains valid and readable

## Output Format
Return:
1. Revised Markdown content
2. Concise change summary:
   - rigor improvements
   - representativeness improvements
   - open evidence gaps
3. Suggested next analyses to close evidence gaps

When editing in-place, still provide a concise before/after summary with key rewritten sections.

## Example Invocations
- `/scientific-markdown-editor docs/report.md strictness=moderate`
- `/scientific-markdown-editor README.md audience=stakeholders strictness=light`
- `/scientific-markdown-editor notebooks/results.md strictness=strong keep_structure_fixed=false`
