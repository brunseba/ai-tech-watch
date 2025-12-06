# AI Technology Watch

A comprehensive technology watch documentation covering AI deployment strategies, infrastructure choices, security, and cost optimization.

## Overview

This documentation project organizes research and analysis on:

- **Architecture & Frameworks**: Agentic AI components, agent frameworks, integration patterns
- **Infrastructure & Hardware**: CPU/GPU/TPU/NPU comparisons, deployment models (edge, on-prem, cloud)
- **Cost & Economics**: TCO analysis, pricing models, capacity planning
- **Security & Compliance**: Authentication, encryption, data governance, RBAC
- **Performance & Optimization**: Quantization, latency requirements, GPU utilization
- **Use Cases & Implementation**: Application patterns, workflow integration examples

## Getting Started

### Prerequisites

- Python 3.10+
- pip or uv package manager

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd ai-tech-survey
```

2. Install dependencies:
```bash
pip install mkdocs-material mkdocs-mermaid2-plugin mkdocs-with-pdf
```

Or using uv:
```bash
uv pip install mkdocs-material mkdocs-mermaid2-plugin mkdocs-with-pdf
```

### Building Documentation

To build and serve the documentation locally:

```bash
mkdocs serve
```

Then open http://127.0.0.1:8000 in your browser.

To build static site:

```bash
mkdocs build
```

The generated site will be in the `site/` directory.

## Project Structure

```
ai-tech-survey/
├── docs/                      # Documentation source
│   ├── architecture/          # AI architecture & frameworks
│   ├── infrastructure/        # Hardware & deployment models
│   ├── cost-economics/        # TCO & pricing analysis
│   ├── security/              # Security & compliance
│   ├── performance/           # Performance optimization
│   ├── use-cases/             # Use cases & implementation
│   ├── index.md               # Home page
│   ├── glossary.md            # AI/ML terminology
│   └── decision-trees.md      # Decision frameworks
├── inputs/                    # Original research files
├── mkdocs.yml                 # MkDocs configuration
├── .pre-commit-config.yaml    # Pre-commit hooks
└── README.md                  # This file
```

## Contributing

### Commit Convention

This project follows [Conventional Commits](https://www.conventionalcommits.org/):

- `feat:` - New feature
- `fix:` - Bug fix
- `docs:` - Documentation changes
- `chore:` - Maintenance tasks
- `refactor:` - Code refactoring
- `test:` - Adding tests

### Pre-commit Hooks

Install pre-commit hooks:

```bash
pre-commit install
pre-commit install --hook-type commit-msg
```

## Deployment

Documentation is automatically deployed to GitHub Pages via GitHub Actions on push to `main` branch.

## License

Internal documentation for technology watch purposes.

## Maintenance

- **Update Frequency**: Quarterly review recommended
- **Content Source**: Research from Perplexity AI, vendor documentation, research papers
- **Version Control**: All changes tracked via git with conventional commits
