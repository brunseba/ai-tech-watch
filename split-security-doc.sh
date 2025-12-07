#!/bin/bash

# Split AI Agent Security Layer document into multiple files
# This script extracts specific line ranges from the original document

SOURCE_FILE="docs/security/ai-agent-security-layer.md"
TARGET_DIR="docs/security/ai-agent-security"

echo "Splitting $SOURCE_FILE into multiple files..."

# Section 3a: Guardrails & IAM (lines 800-1615)
echo "Creating 03a-guardrails-iam.md..."
sed -n '800,1615p' "$SOURCE_FILE" > "$TARGET_DIR/03a-guardrails-iam.md"
# Add navigation footer
echo -e "\n---\n\n**Previous**: [Security Architecture Frameworks](02-security-frameworks.md)  " >> "$TARGET_DIR/03a-guardrails-iam.md"
echo "**Next**: [Data Security & Application Security](03b-data-appsec.md) - 5 data security + 6 app security products" >> "$TARGET_DIR/03a-guardrails-iam.md"

# Section 3b: Data Security & Application Security (lines 1616-2091)
echo "Creating 03b-data-appsec.md..."
sed -n '1616,2091p' "$SOURCE_FILE" > "$TARGET_DIR/03b-data-appsec.md"
echo -e "\n---\n\n**Previous**: [Guardrails & Identity Management](03a-guardrails-iam.md)  " >> "$TARGET_DIR/03b-data-appsec.md"
echo "**Next**: [Threat Detection & Observability](03c-threat-observability.md) - 7 threat detection + 8 observability products" >> "$TARGET_DIR/03b-data-appsec.md"

# Section 3c: Threat Detection & Observability (lines 2092-2731)
echo "Creating 03c-threat-observability.md..."
sed -n '2092,2731p' "$SOURCE_FILE" > "$TARGET_DIR/03c-threat-observability.md"
echo -e "\n---\n\n**Previous**: [Data Security & Application Security](03b-data-appsec.md)  " >> "$TARGET_DIR/03c-threat-observability.md"
echo "**Next**: [Product Comparison Tables](04-product-comparisons.md) - Quick reference decision guides" >> "$TARGET_DIR/03c-threat-observability.md"

# Section 4: Product Comparison Tables (lines 2733-2801)
echo "Creating 04-product-comparisons.md..."
echo "# Product Comparison Tables" > "$TARGET_DIR/04-product-comparisons.md"
echo "" >> "$TARGET_DIR/04-product-comparisons.md"
echo "Quick reference tables for all 42 products across 6 security domains." >> "$TARGET_DIR/04-product-comparisons.md"
echo "" >> "$TARGET_DIR/04-product-comparisons.md"
sed -n '2733,2801p' "$SOURCE_FILE" >> "$TARGET_DIR/04-product-comparisons.md"
echo -e "\n---\n\n**Previous**: [Threat Detection & Observability](03c-threat-observability.md)  " >> "$TARGET_DIR/04-product-comparisons.md"
echo "**Next**: [Integration Patterns](05-integration-patterns.md) - 5 Python code examples + 3 reference architectures" >> "$TARGET_DIR/04-product-comparisons.md"

# Section 5: Integration Patterns (lines 2802-3510)
echo "Creating 05-integration-patterns.md..."
echo "# Integration Patterns" > "$TARGET_DIR/05-integration-patterns.md"
echo "" >> "$TARGET_DIR/05-integration-patterns.md"
echo "Practical integration patterns for securing AI agents across popular frameworks." >> "$TARGET_DIR/05-integration-patterns.md"
echo "" >> "$TARGET_DIR/05-integration-patterns.md"
sed -n '2802,3510p' "$SOURCE_FILE" >> "$TARGET_DIR/05-integration-patterns.md"
echo -e "\n---\n\n**Previous**: [Product Comparison Tables](04-product-comparisons.md)  " >> "$TARGET_DIR/05-integration-patterns.md"
echo "**Next**: [Best Practices & Implementation Roadmap](06-best-practices-roadmap.md) - 20 practices + 4-phase roadmap" >> "$TARGET_DIR/05-integration-patterns.md"

# Section 6: Best Practices & Roadmap (lines 3511-3983)
echo "Creating 06-best-practices-roadmap.md..."
echo "# Best Practices & Implementation Roadmap" > "$TARGET_DIR/06-best-practices-roadmap.md"
echo "" >> "$TARGET_DIR/06-best-practices-roadmap.md"
sed -n '3511,3983p' "$SOURCE_FILE" >> "$TARGET_DIR/06-best-practices-roadmap.md"
echo -e "\n---\n\n**Previous**: [Integration Patterns](05-integration-patterns.md)  " >> "$TARGET_DIR/06-best-practices-roadmap.md"
echo "**Home**: [AI Agent Security Layer Index](index.md)" >> "$TARGET_DIR/06-best-practices-roadmap.md"

echo "✅ All files created successfully!"
echo "Files created in: $TARGET_DIR/"
ls -lh "$TARGET_DIR/"
