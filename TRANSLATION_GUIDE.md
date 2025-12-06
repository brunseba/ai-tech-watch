# Translation Guide

This guide helps you continue translating the AI Tech Survey documentation from French to English.

## Current Status

**Progress**: ~10% complete
- ✅ All technical vocabulary translated (automated)
- ✅ Common phrases translated (automated)  
- ⚠️ Many files have "Franglais" (mixed French/English grammar)
- ⏳ Need sentence-level translation for proper English

**Files Completed**: 
- `docs/architecture/agentic-components-model.md` ✅
- `docs/decision-trees.md` ✅
- `docs/glossary.md` ✅
- `docs/index.md` ✅

**Files In Progress**:
- `docs/infrastructure/deployment-models.md` (50% done)

## Quick Start

### 1. Check Progress

```bash
chmod +x translate-helper.sh
./translate-helper.sh check
```

### 2. See Which Files Need Work

```bash
./translate-helper.sh list-french
```

### 3. Create Backup Before Editing

```bash
./translate-helper.sh backup
```

### 4. Translate a File (Manual)

Open a file and translate French sentences to proper English. Keep:
- Markdown formatting
- Citations `[1]`, `[2]`, etc.
- Technical terms
- Code blocks
- Diagram syntax

### 5. Test Your Changes

```bash
./translate-helper.sh test-build
```

### 6. Commit Your Work

```bash
git add docs/
git commit -m "docs: translate [filename] to English"
```

## Translation Approaches

### Option A: Manual Translation (Most Control)

**Best for**: Small sections, tables, recommendations

**Steps**:
1. Open file in your editor
2. Find French sentences (look for "le", "la", "les", "un", "une", "des")
3. Rewrite in proper English
4. Preserve markdown formatting
5. Test build

**Example**:
```markdown
# Before
Le choice between workstation, server departmental dépend...

# After  
The choice between workstation and departmental server depends...
```

### Option B: LLM-Assisted (Recommended)

**Best for**: Large sections, complex sentences

**Tool**: Claude API, ChatGPT, or local LLM

**Prompt Template**:
```
Translate the following markdown from French to English. 
Rules:
- Keep all markdown formatting exactly as is
- Keep all citations like [1], [2] exactly as is
- Keep technical terms accurate
- Keep Mermaid diagram syntax unchanged
- Keep code blocks unchanged
- Provide ONLY the translated text, no explanations

Text to translate:
[paste markdown section here]
```

**Workflow**:
1. Copy a section from the markdown file
2. Paste into LLM with prompt above
3. Review output for accuracy
4. Paste back into file
5. Test build

### Option C: Batch Translation Script (Advanced)

**For**: Processing multiple similar patterns

Create a script like this:

```bash
#!/bin/bash
# Example: translate-common-phrases.sh

DOCS_DIR="./docs"

# Replace common French phrases with English equivalents
find "$DOCS_DIR" -name "*.md" -type f -exec sed -i '' \
  -e 's/\bCette solution\b/This solution/g' \
  -e 's/\bPermet de\b/Allows to/g' \
  -e 's/\bdans le cas de\b/in the case of/g' \
  {} \;

echo "Translation applied!"
```

**Warning**: Always backup first! Test on one file before batch processing.

## File Priority List

Prioritize by importance and French content:

### High Priority (Core Documentation)
1. `docs/infrastructure/deployment-models.md` ⚠️ (50% done)
2. `docs/infrastructure/hardware-selection.md`
3. `docs/cost-economics/tco-analysis.md`
4. `docs/security/authentication-encryption.md`
5. `docs/security/data-classification.md`

### Medium Priority (Implementation Details)
6. `docs/performance/quantization-8bit.md`
7. `docs/performance/latency-optimization.md`
8. `docs/use-cases/application-types.md`
9. `docs/architecture/llm-architectures.md`
10. `docs/architecture/workload-placement.md`

### Lower Priority (Supplementary)
11. All remaining files in `docs/infrastructure/`
12. All remaining files in `docs/cost-economics/`
13. All remaining files in `docs/security/`
14. All remaining files in `docs/performance/`
15. All remaining files in `docs/use-cases/`

## Common French Patterns to Watch For

### Articles
- `le`, `la`, `les` → `the`
- `un`, `une`, `des` → `a`, `an`, `some`

### Prepositions
- `dans` → `in`, `within`
- `avec` → `with`
- `pour` → `for`
- `sur` → `on`, `about`

### Verbs
- `permet` → `allows`, `enables`
- `nécessite` → `requires`
- `utilise` → `uses`
- `offre` → `offers`, `provides`

### Common Phrases
- `Quand utiliser` → `When to use`
- `Comment choisir` → `How to choose`
- `Cette solution` → `This solution`
- `Il est possible de` → `It is possible to`

## Quality Checklist

Before committing, verify:

- [ ] Sentences are grammatically correct English
- [ ] Technical accuracy maintained
- [ ] All citations `[1]`, `[2]`, etc. preserved
- [ ] Markdown formatting intact
- [ ] Mermaid diagrams unchanged
- [ ] Tables formatted correctly
- [ ] No broken links
- [ ] MkDocs builds successfully (`./translate-helper.sh test-build`)

## Tips

### 1. Work in Small Chunks
Translate one section at a time, commit frequently.

### 2. Use git diff
```bash
git diff docs/filename.md
```
Review your changes before committing.

### 3. Preserve Technical Terms
Don't translate:
- Model names (GPT-4, LLaMA, etc.)
- Technical acronyms (API, GPU, TPU)
- Code snippets
- URLs

### 4. Watch for Context
Some French words have multiple English translations depending on context:
- `données` → `data` or `information`
- `contrôle` → `control` or `verification`
- `modèle` → `model` or `pattern`

### 5. Test Incrementally
After every 2-3 files, run:
```bash
./translate-helper.sh test-build
```

## Useful Commands

### Find files with most French content
```bash
./translate-helper.sh find-patterns
```

### Check specific file
```bash
grep -n " le \| la \| les " docs/path/to/file.md
```

### Count French words in file
```bash
grep -o " le \| la \| les \| un \| une \| des " docs/path/to/file.md | wc -l
```

### Compare before/after
```bash
git diff HEAD~1 docs/path/to/file.md
```

## Example Translation Session

```bash
# 1. Check current status
./translate-helper.sh check

# 2. Create backup
./translate-helper.sh backup

# 3. List files needing work
./translate-helper.sh list-french

# 4. Open high-priority file
vim docs/infrastructure/deployment-models.md

# 5. Translate a section using LLM or manually
# ... edit the file ...

# 6. Test build
./translate-helper.sh test-build

# 7. Check your changes
git diff docs/infrastructure/deployment-models.md

# 8. Commit
git add docs/infrastructure/deployment-models.md
git commit -m "docs: complete translation of deployment-models.md"

# 9. Repeat for next file
```

## Getting Help

### If MkDocs Build Fails
1. Check the error message carefully
2. Look for markdown syntax errors
3. Verify Mermaid diagram syntax
4. Check table formatting
5. Review the build log: `/tmp/mkdocs-build.log`

### Common Issues

**Issue**: Broken table after translation
**Fix**: Make sure all rows have same number of `|` separators

**Issue**: Mermaid diagram not rendering
**Fix**: Don't translate Mermaid syntax keywords (flowchart, subgraph, etc.)

**Issue**: Citations disappeared
**Fix**: Search for `[1]`, `[2]` in original and restored them

## Completion Goal

All 26 markdown files should have:
✅ Proper English grammar and sentence structure
✅ Technical accuracy maintained  
✅ All formatting preserved
✅ MkDocs builds without errors
✅ Citations intact

Estimated time: 10-20 hours depending on approach

## Resources

- Original input files: `inputs/` (for reference)
- Backups: `backups/` (created by script)
- MkDocs documentation: https://www.mkdocs.org/
- Mermaid syntax: https://mermaid.js.org/

Good luck! 🚀
