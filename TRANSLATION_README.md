# Translation Toolkit

Three tools to help you complete the French-to-English translation:

## 📋 Quick Start

```bash
# 1. Check your progress
./translate-helper.sh check

# 2. See which files need work
./translate-with-llm.sh priority

# 3. Pick a file and start translating!
```

## 🛠️ Tools Overview

### 1. `translate-helper.sh` - Progress Tracking & Testing

**Purpose**: Monitor progress, find patterns, backup, and test builds

**Commands**:
```bash
./translate-helper.sh check          # Show translation progress
./translate-helper.sh list-french    # List files with French content
./translate-helper.sh stats          # Detailed statistics
./translate-helper.sh find-patterns  # Find common French patterns
./translate-helper.sh backup         # Create backup before editing
./translate-helper.sh test-build     # Test MkDocs build
```

**When to use**: 
- Before starting work (check progress)
- After each file (test build)
- To find which files need most work

### 2. `translate-with-llm.sh` - LLM-Assisted Translation

**Purpose**: Prepare files for translation using Claude, ChatGPT, or other LLMs

**Commands**:
```bash
./translate-with-llm.sh priority                        # Show priority list
./translate-with-llm.sh prepare FILE                    # Prepare file with prompt
./translate-with-llm.sh extract FILE                    # Split large file into sections
```

**When to use**:
- For translating entire files quickly
- When you want LLM to handle complex sentences
- To split large files into manageable sections

**Example workflow**:
```bash
# Prepare a file for translation
./translate-with-llm.sh prepare docs/infrastructure/hardware-selection.md

# This creates /tmp/translate-ai-survey/hardware-selection_prompt.txt
# Copy that file, paste into Claude/ChatGPT, get translation back

# Or for large files, extract sections first:
./translate-with-llm.sh extract docs/infrastructure/hardware-selection.md
```

### 3. `TRANSLATION_GUIDE.md` - Complete Manual

**Purpose**: Comprehensive guide with strategies, tips, and troubleshooting

**Contains**:
- Current status and priority list
- Three translation approaches (manual, LLM-assisted, batch)
- Common French patterns to watch for
- Quality checklist
- Troubleshooting guide
- Example translation sessions

**When to use**: 
- First time translating
- When you encounter issues
- For detailed strategies

## 🎯 Recommended Workflow

### For Small Files (< 100 lines)

```bash
# 1. Check which files need work
./translate-with-llm.sh priority

# 2. Backup before starting
./translate-helper.sh backup

# 3. Prepare file for LLM
./translate-with-llm.sh prepare docs/path/to/file.md

# 4. Copy /tmp/translate-ai-survey/file_prompt.txt
# 5. Paste into Claude.ai or ChatGPT
# 6. Get translation, paste back into original file

# 7. Test build
./translate-helper.sh test-build

# 8. Commit
git add docs/path/to/file.md
git commit -m "docs: translate file.md to English"
```

### For Large Files (> 100 lines)

```bash
# 1. Extract into sections
./translate-with-llm.sh extract docs/path/to/large-file.md

# 2. Find sections in /tmp/translate-ai-survey/large-file/
# 3. Translate each section separately with LLM
# 4. Update original file section by section
# 5. Test and commit
```

### For Manual Translation

```bash
# 1. Find patterns first
./translate-helper.sh find-patterns

# 2. Open file in editor
vim docs/path/to/file.md

# 3. Search for French articles: / le \| la \| les
# 4. Translate sentences
# 5. Save and test
./translate-helper.sh test-build
```

## 📊 Current Progress

Run `./translate-helper.sh check` to see:
- Total markdown files
- Files with French content remaining
- Translation commits made
- Estimated completion percentage

## 🎓 Translation Tips

### What NOT to Translate
- Model names: GPT-4, LLaMA, Claude, etc.
- Technical acronyms: API, GPU, CPU, TPU, NPU
- Code blocks
- Mermaid diagram keywords (flowchart, subgraph)
- URLs and links
- Citations [1], [2], [3]

### What TO Translate
- All narrative text
- Section headers
- Table contents
- Diagram labels (but not Mermaid keywords)
- Recommendations and examples

### Quality Checks
After translating a file:
- [ ] Read it aloud - does it sound natural?
- [ ] All citations still present?
- [ ] Technical terms accurate?
- [ ] MkDocs builds successfully?
- [ ] No broken markdown formatting?

## 🚨 Troubleshooting

### Script Not Running
```bash
chmod +x translate-helper.sh translate-with-llm.sh
```

### MkDocs Build Fails
```bash
# Check the error log
cat /tmp/mkdocs-build.log

# Common issues:
# - Broken table (check | separators)
# - Mermaid syntax error (don't translate keywords)
# - Missing closing quotes or brackets
```

### "Command not found: mkdocs"
```bash
pip install mkdocs-material
```

## 📁 File Locations

- **Scripts**: Project root directory
- **Documentation**: `docs/` directory
- **Temp files**: `/tmp/translate-ai-survey/`
- **Backups**: `backups/` (created by backup command)
- **Original inputs**: `inputs/` (for reference)

## 🎯 Priority Files

High priority (start here):
1. `docs/infrastructure/deployment-models.md` ⚠️ (partially done)
2. `docs/infrastructure/hardware-selection.md`
3. `docs/cost-economics/tco-analysis.md`
4. `docs/security/authentication-encryption.md`
5. `docs/security/data-classification.md`

Run `./translate-with-llm.sh priority` for full prioritized list.

## ⏱️ Time Estimates

- **Per file** (with LLM): 10-20 minutes
- **Per file** (manual): 30-60 minutes
- **Complete project**: 10-20 hours total

## 🆘 Need Help?

1. Read `TRANSLATION_GUIDE.md` for detailed instructions
2. Check git history: `git log --grep=translate` to see previous translation work
3. Compare with completed file: `docs/architecture/agentic-components-model.md`

## ✅ When You're Done

All files should have:
- ✅ Proper English grammar
- ✅ Technical accuracy maintained
- ✅ All citations intact
- ✅ Markdown formatting preserved
- ✅ MkDocs builds successfully

Test final build:
```bash
./translate-helper.sh test-build
```

Deploy to GitHub Pages:
```bash
git push origin main
```

---

**Good luck!** 🎉 You've got all the tools you need to finish this translation efficiently.
