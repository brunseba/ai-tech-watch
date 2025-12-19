# Warp AI Agent Rules - AI Technology Watch

Project-specific rules for AI assistants working on the AI Technology Watch documentation repository.

---

## Project Overview

**Repository**: ai-tech-watch  
**Purpose**: Comprehensive technology watch documentation for AI deployment strategies, infrastructure decisions, security, and cost optimization  
**Stack**: MkDocs with Material theme, Mermaid diagrams, Python utilities  
**Deployment**: GitHub Pages via GitHub Actions

---

## Documentation Standards

### Content Organization

1. **Primary Sections**:
   - `docs/architecture/` - AI frameworks, agentic components, integration patterns
   - `docs/infrastructure/` - Hardware selection (CPU/GPU/TPU/NPU), deployment models
   - `docs/cost-economics/` - TCO analysis, pricing, capacity planning
   - `docs/security/` - Authentication, compliance, data governance
   - `docs/performance/` - Quantization, latency, optimization strategies
   - `docs/use-cases/` - Implementation patterns, workflow examples
   - `docs/reference/` - Glossary, decision frameworks, catalogs
   - `docs/presentations/` - Marp presentation files
   - `docs/sales-collateral/` - Pre-sales materials, qualification checklists

2. **File Placement Rules**:
   - All `.md` files MUST be in `docs/` subdirectories (NEVER in root)
   - Exception: `README.md`, `CHANGELOG.md`, `WARP.md` in root only
   - Reference materials go in `docs/reference/`
   - Presentation materials use Marp format in `docs/presentations/`

3. **Mermaid Diagrams**:
   - Use Mermaid diagrams for architecture, workflows, decision trees
   - Keep diagrams readable (limit to 40-50 nodes)
   - Use color coding for visual clarity
   - Include diagram source in markdown (no separate .mmd files)

### Content Quality Standards

1. **Research-Backed**:
   - All technical claims must be verifiable
   - Prefer primary sources: vendor docs, academic papers, official specifications
   - Include citations where appropriate
   - Update pricing and specifications quarterly

2. **Practical Focus**:
   - Provide actionable guidance, not just theory
   - Include real-world examples and code samples
   - Provide cost calculations and ROI analysis
   - Include decision frameworks and comparison tables

3. **Code Examples**:
   - Use Python 3.10+ syntax
   - Include complete, runnable examples when possible
   - Document dependencies and prerequisites
   - Use realistic, production-quality patterns

4. **Length Guidelines**:
   - Individual docs: 200-1000 lines for comprehensive guides
   - Overview pages: 50-200 lines
   - Quick references: 100-400 lines
   - Break very large topics into subsections

---

## File Structure Patterns

### Standard Documentation File Template

```markdown
# [Topic Name]

Brief description (1-2 sentences).

---

## Table of Contents (for docs > 200 lines)

1. [Section 1](#section-1)
2. [Section 2](#section-2)
...

---

## Section 1

Content with subsections as needed.

### Subsection

Details with examples, tables, diagrams.

---

## Additional Resources

Links to related documentation.

---

**Last Updated**: [Month Year]  
**Version**: [X.Y]
```

### Presentation File Structure (Marp)

- Use Marp markdown format
- Include frontmatter with theme and styling
- Target: 40-60 slides for comprehensive topics
- Export instructions in accompanying README

---

## Git Workflow

### Conventional Commits (REQUIRED)

Use semantic commit messages:

- `feat(section):` - New documentation or major content additions
- `docs(section):` - Documentation improvements, clarifications
- `fix(section):` - Corrections, broken links
- `refactor(section):` - Reorganization without content changes
- `chore:` - Maintenance (dependencies, config)
- `style:` - Formatting, whitespace

**Co-authorship**: Include in commit messages:
```
feat(performance): add optimization guide

- Description of changes
- More details

Co-Authored-By: Warp <agent@warp.dev>
```

### Branching

- `main` - production, auto-deploys to GitHub Pages
- Feature branches for major additions
- Tag releases with semantic versioning (v1.0.0, v1.1.0, etc.)

### Pre-commit Hooks

Required hooks configured in `.pre-commit-config.yaml`:
- Markdown linting
- Trailing whitespace removal
- YAML validation
- Conventional commit message validation

Install: `pre-commit install && pre-commit install --hook-type commit-msg`

---

## MkDocs Configuration

### Theme: Material

**Key Features Enabled**:
- Dark/light mode toggle
- Navigation tabs (sticky)
- Search with suggestions
- Code copy buttons
- Git revision dates
- Mermaid diagram support

### Navigation Structure (`mkdocs.yml`)

When adding new documentation:
1. Place file in appropriate `docs/` subdirectory
2. Add entry to `nav:` section in `mkdocs.yml`
3. Update section overview (`index.md`) with link
4. Update main `docs/index.md` if major addition

### Mermaid Plugin Configuration

- Plugin: `mkdocs-mermaid2-plugin`
- Version: 10.6.1
- Diagrams render on build and serve
- Use `mermaid` code blocks in markdown

---

## Content Update Workflow

### When Adding Major New Content:

1. **Research Phase**:
   - Gather sources, verify accuracy
   - Review existing documentation for overlap
   - Identify related topics for cross-linking

2. **Creation Phase**:
   - Create markdown file in appropriate subdirectory
   - Follow template structure
   - Include mermaid diagrams where helpful
   - Add code examples with proper syntax highlighting

3. **Integration Phase**:
   - Update `mkdocs.yml` navigation
   - Update section `index.md`
   - Update main `docs/index.md` if significant
   - Add cross-references in related documents

4. **Verification Phase**:
   - Test locally: `mkdocs serve`
   - Check all links work
   - Verify diagrams render correctly
   - Review for completeness

5. **Commit & Push**:
   - Stage changes: `git add .`
   - Commit with conventional message
   - Push to trigger GitHub Pages deployment

### When Updating Existing Content:

1. Read current content fully before editing
2. Preserve existing structure unless reorganization needed
3. Update "Last Updated" timestamp
4. Increment version if major changes
5. Use `docs(section):` commit type for clarifications
6. Use `feat(section):` for substantial additions

---

## Code Examples Standards

### Python Code Blocks

```python
# Use type hints
def calculate_cost(tokens: int, model: str) -> float:
    """Calculate LLM API cost.
    
    Args:
        tokens: Total tokens consumed
        model: Model identifier (e.g., 'gpt-4', 'claude-3')
    
    Returns:
        Cost in USD
    """
    pricing = {
        'gpt-4': 0.03,  # per 1K tokens
        'gpt-3.5': 0.002
    }
    return (tokens / 1000) * pricing.get(model, 0.03)
```

**Standards**:
- Include docstrings for functions
- Use type hints
- Provide realistic examples
- Include error handling where relevant
- Keep examples under 100 lines

### Shell Commands

```bash
# Use absolute paths when possible
mkdocs serve --dev-addr=127.0.0.1:8000

# Document prerequisites
pip install -r requirements.txt
```

---

## Specific Content Guidelines

### Architecture Documentation

- Include component diagrams (Mermaid)
- Provide framework comparisons in tables
- Link to official framework documentation
- Include integration patterns with code

### Cost Economics

- Use current pricing (update quarterly)
- Provide ROI calculation templates
- Include 3-year TCO analysis methodology
- Show cost comparison tables

### Security Documentation

- Reference industry standards (NIST, OWASP, ISO)
- Include compliance frameworks (GDPR, HIPAA, SOC 2)
- Provide implementation examples
- Link to product documentation

### Performance Documentation

- Include benchmarking methodology
- Provide quantization impact analysis
- Show optimization code examples
- Include monitoring and observability tools

### Use Cases

- Provide real-world scenarios
- Include workflow diagrams
- Show implementation patterns
- Estimate complexity and cost

---

## Testing & Validation

### Before Committing:

1. **Local Build Test**:
   ```bash
   mkdocs build --strict
   ```
   Must complete with no warnings

2. **Local Serve Test**:
   ```bash
   mkdocs serve
   ```
   - Check all navigation links
   - Verify mermaid diagrams render
   - Test search functionality
   - Verify dark/light mode

3. **Link Validation**:
   - Internal links use relative paths
   - External links are HTTPS where possible
   - Check for broken links

4. **Diagram Validation**:
   - All mermaid diagrams render without errors
   - Diagrams are readable and not overcrowded
   - Color schemes work in dark/light modes

---

## Presentation Guidelines (Marp)

### File Standards

- Location: `docs/presentations/`
- Format: Marp markdown (.md)
- Naming: kebab-case (e.g., `ai-implementation-assessment.md`)

### Slide Structure

```markdown
---
marp: true
theme: default
paginate: true
---

# Title Slide
Subtitle

---

## Content Slide
- Bullet points
- Keep concise

---
```

### Export Commands

Document in `docs/presentations/README.md`:
```bash
# HTML
marp presentation.md -o output.html

# PDF
marp presentation.md --pdf -o output.pdf

# PowerPoint
marp presentation.md --pptx -o output.pptx
```

---

## AI Assistant Behavior Guidelines

### When Working on This Project:

1. **Always Research First**:
   - Read existing documentation before suggesting changes
   - Understand current structure and patterns
   - Identify cross-references needed

2. **Maintain Consistency**:
   - Follow existing file naming conventions
   - Match tone and style of existing content
   - Use established terminology from glossary

3. **Be Comprehensive**:
   - Provide complete implementations, not stubs
   - Include error handling and edge cases
   - Add links to related topics

4. **Update Holistically**:
   - When adding content, update navigation
   - Cross-reference related documents
   - Update overview pages

5. **Verify Quality**:
   - Test builds locally before committing
   - Check diagram rendering
   - Validate all links

### What to Avoid:

- ❌ Creating markdown files in project root
- ❌ Half-finished code examples with TODOs
- ❌ Unsourced technical claims
- ❌ Breaking existing navigation structure
- ❌ Committing without testing locally
- ❌ Generic content without actionable guidance
- ❌ Overly long documents without sections
- ❌ Missing cross-references to related topics

### When Creating New Major Features:

1. Create comprehensive content first
2. Test all diagrams and code examples
3. Update navigation in all relevant places
4. Add to main index with 🆕 emoji for visibility
5. Commit with detailed conventional commit message
6. Verify GitHub Pages deployment succeeds

---

## Maintenance Tasks

### Quarterly Reviews (Recommended):

- [ ] Update pricing information (cost-economics section)
- [ ] Review framework versions (architecture section)
- [ ] Update hardware specifications (infrastructure section)
- [ ] Check external links for validity
- [ ] Review and update compliance standards
- [ ] Update performance benchmarks if significant changes

### Version Tagging:

When substantial content is added:
```bash
# Increment minor version for feature additions
git tag -a v1.2.0 -m "Release v1.2.0: Add performance optimization guide"
git push origin v1.2.0
```

Major version (v2.0.0): Complete restructure or rewrite  
Minor version (v1.1.0): Significant new sections  
Patch version (v1.0.1): Small fixes and updates

---

## Key Repository Information

**URLs**:
- Repository: https://github.com/brunseba/ai-tech-watch
- Documentation: https://brunseba.github.io/ai-tech-watch/
- Issues: https://github.com/brunseba/ai-tech-watch/issues

**Technology Stack**:
- MkDocs: 1.5+
- Material Theme: 9.x
- Mermaid Plugin: 10.6.1
- Python: 3.10+
- Git Revision Date Plugin: Enabled

**Build & Deploy**:
- Automated via GitHub Actions on push to `main`
- Manual build: `mkdocs build`
- Local serve: `mkdocs serve`

---

## Contact & Support

For questions about this project structure or conventions:
1. Review existing documentation first
2. Check GitHub Issues for similar questions
3. Follow patterns established in existing files

---

**Last Updated**: December 2025  
**Version**: 1.0
