# Presentations

This directory contains Marp presentation slides for AI Technology Watch documentation.

## Available Presentations

### 1. AI Implementation Decision Framework
**File**: `ai-implementation-assessment.md`

**Description**: Comprehensive presentation covering the 5-phase assessment process for determining whether to use Standard Development, AI/ML, or AI Agentic approaches.

**Slides**: 40+ slides covering:
- Problem statement and cost implications
- Quick decision tool (30-second assessment)
- 5-phase assessment process
- Complexity scoring matrix (0-50 scale)
- Technology stack selection for all approaches
- Framework selection guide (11 frameworks)
- Real-world examples (Invoice Processing, Customer Support, Discount Calculator)
- Cost-benefit analysis (3-year TCO)
- Implementation timelines
- Red flags and warning signs
- Decision-making checklists
- Appendices with templates

**Target Audience**: Decision makers, architects, engineering leads, product managers

**Duration**: 45-60 minutes (with Q&A)

---

## How to Use Marp Presentations

### Option 1: Marp CLI (Recommended)

#### Install Marp CLI
```bash
npm install -g @marp-team/marp-cli
```

#### Generate HTML
```bash
marp ai-implementation-assessment.md -o ai-implementation-assessment.html
```

#### Generate PDF
```bash
marp ai-implementation-assessment.md --pdf -o ai-implementation-assessment.pdf
```

#### Generate PowerPoint
```bash
marp ai-implementation-assessment.md --pptx -o ai-implementation-assessment.pptx
```

#### Watch mode (auto-rebuild on save)
```bash
marp ai-implementation-assessment.md -w
```

#### Preview in browser
```bash
marp ai-implementation-assessment.md -s
```

---

### Option 2: VS Code Extension

#### Install Extension
1. Open VS Code
2. Go to Extensions (Cmd+Shift+X / Ctrl+Shift+X)
3. Search for "Marp for VS Code"
4. Install the extension

#### Use Extension
1. Open the `.md` file
2. Click "Open Preview to the Side" button (or Cmd+K V / Ctrl+K V)
3. Edit slides and see live preview
4. Export via command palette: "Marp: Export Slide Deck"

---

### Option 3: Marp Web

1. Go to https://web.marp.app/
2. Copy and paste the markdown content
3. Preview and export

---

## Presentation Tips

### Customization

**Change Theme**: Edit the frontmatter
```yaml
---
marp: true
theme: gaia  # Options: default, gaia, uncover
---
```

**Custom Colors**: Modify the style section
```yaml
style: |
  section {
    background-color: #f5f5f5;
  }
  h1 {
    color: #2196f3;
  }
```

**Add Speaker Notes**: Use HTML comments
```markdown
<!--
Speaker notes go here.
These won't appear in the presentation.
-->
```

### Keyboard Shortcuts (Browser Preview)
- **Next slide**: Arrow Right, Space, Page Down
- **Previous slide**: Arrow Left, Page Up
- **First slide**: Home
- **Last slide**: End
- **Fullscreen**: F
- **Exit fullscreen**: Esc

### Best Practices

1. **Test exports**: Always test HTML/PDF exports before presenting
2. **Font sizes**: Keep text readable (avoid going below 18pt)
3. **Contrast**: Ensure good color contrast for readability
4. **Images**: Optimize images for faster loading
5. **Code blocks**: Keep code snippets short and readable
6. **Timing**: Aim for 1-2 minutes per slide
7. **Backup**: Have a PDF backup in case of technical issues

---

## Presentation Structure

### Standard Structure
1. **Title slide** - Introduction
2. **Agenda** - What to expect
3. **Problem** - Why this matters
4. **Solution** - Your approach
5. **Details** - Deep dive content
6. **Examples** - Real-world applications
7. **Takeaways** - Key points
8. **Next steps** - Actions
9. **Q&A** - Questions
10. **Appendix** - Supporting materials

### Tips for Effective Slides
- **One idea per slide**
- **Use visuals** (tables, diagrams, icons)
- **Minimal text** (bullet points, not paragraphs)
- **Consistent formatting**
- **Clear hierarchy** (h1 for titles, h2 for sections)

---

## Exporting Formats

### HTML
- **Pros**: Interactive, no software needed, works on any device
- **Cons**: Requires browser, may have rendering differences
- **Use when**: Sharing online, remote presentations

### PDF
- **Pros**: Universal format, looks identical everywhere, printable
- **Cons**: Static, larger file size
- **Use when**: Printing, archiving, email distribution

### PowerPoint (PPTX)
- **Pros**: Editable, familiar format, works with Office
- **Cons**: May lose some formatting, requires PowerPoint
- **Use when**: Others need to edit, corporate environments

---

## Troubleshooting

### Issue: Mermaid diagrams not rendering
**Solution**: Marp doesn't support Mermaid natively. Options:
1. Export diagrams as images and embed
2. Use HTML `<img>` tags with external SVGs
3. Use Marp's built-in diagram support (limited)

### Issue: Tables look weird
**Solution**: 
- Check for consistent column counts
- Use proper Markdown table syntax
- Consider using HTML tables for complex layouts

### Issue: Images not showing in PDF
**Solution**:
- Use absolute paths or embed as data URIs
- Ensure images are in the same directory
- Use `--allow-local-files` flag with Marp CLI

---

## Additional Resources

### Marp Documentation
- Official docs: https://marpit.marp.app/
- Marp CLI: https://github.com/marp-team/marp-cli
- VS Code extension: https://marketplace.visualstudio.com/items?itemName=marp-team.marp-vscode

### Presentation Design
- Color schemes: https://coolors.co/
- Icons: https://fonts.google.com/icons
- Stock photos: https://unsplash.com/

---

**Last Updated**: December 2025
