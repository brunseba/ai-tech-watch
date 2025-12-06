#!/bin/bash
# LLM-Assisted Translation Script
# This script helps translate markdown files using Claude API or other LLMs

set -e

# Colors
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Configuration
PROJECT_ROOT="$(cd "$(dirname "$0")" && pwd)"
DOCS_DIR="$PROJECT_ROOT/docs"
TEMP_DIR="/tmp/translate-ai-survey"

mkdir -p "$TEMP_DIR"

# Show usage
show_usage() {
    echo -e "${BLUE}LLM-Assisted Translation Script${NC}"
    echo ""
    echo "This script helps you translate markdown files using LLMs like Claude or ChatGPT."
    echo ""
    echo "Usage: ./translate-with-llm.sh [command] [options]"
    echo ""
    echo "Commands:"
    echo "  extract FILE      Extract sections from a file for translation"
    echo "  prepare FILE      Prepare a file with translation prompt"
    echo "  priority          Show files in priority order"
    echo ""
    echo "Examples:"
    echo "  ./translate-with-llm.sh extract docs/infrastructure/hardware-selection.md"
    echo "  ./translate-with-llm.sh prepare docs/infrastructure/hardware-selection.md"
    echo "  ./translate-with-llm.sh priority"
}

# Count French content in a file
count_french() {
    local file="$1"
    grep -o " le \| la \| les \| un \| une \| des " "$file" 2>/dev/null | wc -l | tr -d ' '
}

# Show priority list
show_priority() {
    echo -e "${BLUE}=== Files Prioritized by Translation Need ===${NC}\n"
    
    echo "Scanning files..."
    temp_list="$TEMP_DIR/priority_list.txt"
    > "$temp_list"
    
    # Scan all markdown files
    while IFS= read -r file; do
        # Skip already completed files
        basename=$(basename "$file")
        if [[ "$basename" == "index.md" || "$basename" == "glossary.md" || "$basename" == "decision-trees.md" ]]; then
            continue
        fi
        
        count=$(count_french "$file")
        if [ "$count" -gt 0 ]; then
            relative_path=${file#$PROJECT_ROOT/}
            echo "$count|$relative_path" >> "$temp_list"
        fi
    done < <(find "$DOCS_DIR" -name "*.md" -type f)
    
    # Sort by count (descending) and display
    echo ""
    echo -e "${GREEN}High Priority (most French content):${NC}"
    sort -t'|' -k1 -rn "$temp_list" | head -5 | while IFS='|' read count path; do
        echo -e "  ${YELLOW}$path${NC} - $count occurrences"
    done
    
    echo ""
    echo -e "${GREEN}Medium Priority:${NC}"
    sort -t'|' -k1 -rn "$temp_list" | tail -n +6 | head -5 | while IFS='|' read count path; do
        echo -e "  ${YELLOW}$path${NC} - $count occurrences"
    done
    
    echo ""
    total=$(wc -l < "$temp_list" | tr -d ' ')
    echo "Total files needing translation: $total"
    echo ""
    echo "View full list: cat $temp_list"
}

# Extract sections from a file
extract_sections() {
    local file="$1"
    
    if [ ! -f "$file" ]; then
        echo -e "${RED}File not found: $file${NC}"
        exit 1
    fi
    
    echo -e "${BLUE}=== Extracting Sections from $file ===${NC}\n"
    
    output_dir="$TEMP_DIR/$(basename "$file" .md)"
    mkdir -p "$output_dir"
    
    # Split by level 2 headers (##)
    awk '/^## / {if (section) {close(filename)}; section=$0; gsub(/[^a-zA-Z0-9]/, "_", section); filename="'$output_dir'/"section".md"; gsub(/__+/, "_", filename)} section {print > filename}' "$file"
    
    section_count=$(ls -1 "$output_dir" 2>/dev/null | wc -l | tr -d ' ')
    
    if [ "$section_count" -gt 0 ]; then
        echo -e "${GREEN}Extracted $section_count sections to: $output_dir${NC}\n"
        echo "Files:"
        ls -1 "$output_dir"
        echo ""
        echo "You can now:"
        echo "1. Copy each section file content"
        echo "2. Paste into your LLM with the translation prompt"
        echo "3. Paste the translated result back into the original file"
    else
        echo -e "${YELLOW}No level 2 headers found. File might be small enough to translate as a whole.${NC}"
    fi
}

# Prepare a file with translation prompt
prepare_for_translation() {
    local file="$1"
    
    if [ ! -f "$file" ]; then
        echo -e "${RED}File not found: $file${NC}"
        exit 1
    fi
    
    basename=$(basename "$file")
    output_file="$TEMP_DIR/${basename%.md}_prompt.txt"
    
    echo -e "${BLUE}=== Preparing Translation Prompt ===${NC}\n"
    
    # Create prompt file
    cat > "$output_file" << 'EOF'
TRANSLATION INSTRUCTIONS
========================

Please translate the following markdown content from French to English.

CRITICAL RULES:
1. Preserve ALL markdown formatting exactly as is
2. Keep ALL citations [1], [2], [3] etc. in their exact positions
3. Keep technical terms accurate (GPT-4, LLaMA, Kubernetes, etc.)
4. DO NOT translate Mermaid diagram syntax (flowchart, subgraph, etc.)
5. DO NOT translate code blocks
6. DO NOT translate URLs
7. Keep all emojis and special characters
8. Maintain the same paragraph structure
9. Provide ONLY the translated markdown, no explanations

EXAMPLE:
French:  "Le système permet de gérer les données [1]"
English: "The system allows managing data [1]"

CONTENT TO TRANSLATE:
=====================

EOF
    
    # Append the actual file content
    cat "$file" >> "$output_file"
    
    echo -e "${GREEN}Prompt file created: $output_file${NC}\n"
    
    lines=$(wc -l < "$file" | tr -d ' ')
    french_count=$(count_french "$file")
    
    echo "File statistics:"
    echo "  Total lines: $lines"
    echo "  French occurrences: $french_count"
    echo ""
    echo "Next steps:"
    echo "1. Open $output_file"
    echo "2. Copy the entire content"
    echo "3. Paste into Claude/ChatGPT (or your LLM of choice)"
    echo "4. Copy the translated result"
    echo "5. Replace the content of $file with the translation"
    echo "6. Test: ./translate-helper.sh test-build"
    echo "7. Commit: git add $file && git commit -m 'docs: translate $(basename $file)'"
    echo ""
    echo -e "${YELLOW}TIP:${NC} For large files, consider using ./translate-with-llm.sh extract first"
}

# Check API key for Claude (optional)
check_api_key() {
    if [ -z "$ANTHROPIC_API_KEY" ]; then
        echo -e "${YELLOW}Note: ANTHROPIC_API_KEY not set${NC}"
        echo "If you want to use Claude API directly, set it with:"
        echo "export ANTHROPIC_API_KEY='your-api-key'"
        echo ""
        echo "Otherwise, you can copy/paste to claude.ai or chat.openai.com manually"
        echo ""
    fi
}

# Main script logic
case "${1:-}" in
    extract)
        if [ -z "$2" ]; then
            echo -e "${RED}Error: Please provide a file path${NC}"
            echo "Usage: ./translate-with-llm.sh extract FILE"
            exit 1
        fi
        extract_sections "$2"
        ;;
    prepare)
        if [ -z "$2" ]; then
            echo -e "${RED}Error: Please provide a file path${NC}"
            echo "Usage: ./translate-with-llm.sh prepare FILE"
            exit 1
        fi
        check_api_key
        prepare_for_translation "$2"
        ;;
    priority)
        show_priority
        ;;
    help|--help|-h)
        show_usage
        ;;
    *)
        show_usage
        exit 1
        ;;
esac
