# Translation Quick Reference Card

## 🚀 Start Here

```bash
# See what needs to be done
./translate-with-llm.sh priority

# Start with highest priority file
./translate-helper.sh backup
./translate-with-llm.sh prepare docs/security/authentication-encryption.md
```

## 📝 Three Ways to Translate

### Method 1: LLM-Assisted (Recommended) ⭐
```bash
./translate-with-llm.sh prepare FILE.md
# Copy /tmp/translate-ai-survey/FILE_prompt.txt
# Paste into Claude/ChatGPT
# Get translation, paste back
./translate-helper.sh test-build
git commit -m "docs: translate FILE.md"
```

### Method 2: Manual Edit
```bash
vim FILE.md
# Search for: / le \| la \| les
# Translate sentences
./translate-helper.sh test-build
git commit -m "docs: translate FILE.md"
```

### Method 3: Large Files
```bash
./translate-with-llm.sh extract FILE.md
# Translate sections in /tmp/translate-ai-survey/FILE/
# Update original file section by section
```

## 📊 Check Progress Anytime

```bash
./translate-helper.sh check        # Quick progress overview
./translate-helper.sh list-french  # List all files with French
./translate-helper.sh find-patterns # Find common untranslated words
```

## 🎯 Current Top 5 Priorities

1. `docs/security/authentication-encryption.md` (45 occurrences)
2. `docs/security/compliance-risks.md` (43 occurrences)  
3. `docs/infrastructure/hardware-comparison.md` (40 occurrences)
4. `docs/architecture/agentic-workflows.md` (40 occurrences)
5. `docs/performance/quantization-methodology.md` (37 occurrences)

## ✅ Before Each Commit

```bash
./translate-helper.sh test-build  # Must pass!
git diff FILE.md                  # Review your changes
```

## 🔍 Common French → English

| French | English |
|--------|---------|
| le/la/les | the |
| un/une/des | a/an/some |
| permet | allows/enables |
| nécessite | requires |
| dans | in/within |
| avec | with |
| pour | for |

## 🚫 Don't Translate

- Model names (GPT-4, LLaMA)
- Technical terms (API, GPU, CPU)
- Citations [1], [2], [3]
- Code blocks
- Mermaid keywords (flowchart, subgraph)
- URLs

## 🆘 Quick Troubleshooting

| Problem | Solution |
|---------|----------|
| Script won't run | `chmod +x translate-helper.sh translate-with-llm.sh` |
| Build fails | Check `/tmp/mkdocs-build.log` |
| Broken table | Count `\|` separators in each row |
| Missing citations | Search original for `[1]`, `[2]` |

## 💾 Safety First

```bash
# Always backup before major edits
./translate-helper.sh backup

# Commit frequently
git add . && git commit -m "docs: translate X"
```

## 📈 Progress Tracking

- **Total files**: 35
- **Need translation**: 25
- **Completion**: ~28%
- **Remaining**: ~72%

## ⏱️ Time Budget

- **Per file with LLM**: 10-20 min
- **Per file manual**: 30-60 min
- **Total project**: 10-20 hours

## 🎓 Full Documentation

- `TRANSLATION_README.md` - Complete workflows
- `TRANSLATION_GUIDE.md` - Detailed strategies
- `translate-helper.sh help` - Script commands
- `translate-with-llm.sh help` - LLM tool commands

---

**Remember**: Translate for clarity, preserve technical accuracy, test builds! 🎯
