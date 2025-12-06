#!/bin/bash
# Translation Helper Script for AI Tech Survey Documentation
# This script helps continue the French-to-English translation work

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Project root
PROJECT_ROOT="$(cd "$(dirname "$0")" && pwd)"
DOCS_DIR="$PROJECT_ROOT/docs"

# Function to show usage
show_usage() {
    echo -e "${BLUE}Translation Helper Script${NC}"
    echo ""
    echo "Usage: ./translate-helper.sh [command]"
    echo ""
    echo "Commands:"
    echo "  check          Check translation progress"
    echo "  list-french    List files with remaining French content"
    echo "  stats          Show detailed translation statistics"
    echo "  find-patterns  Find common French patterns to translate"
    echo "  backup         Create a backup before making changes"
    echo "  test-build     Test if mkdocs builds successfully"
    echo ""
    echo "Examples:"
    echo "  ./translate-helper.sh check"
    echo "  ./translate-helper.sh list-french"
}

# Check translation progress
check_progress() {
    echo -e "${BLUE}=== Translation Progress Check ===${NC}\n"
    
    # Count total markdown files
    total_files=$(find "$DOCS_DIR" -name "*.md" -type f | wc -l | tr -d ' ')
    echo -e "${GREEN}Total markdown files:${NC} $total_files"
    
    # Count files with French articles (indicators of untranslated content)
    french_files=$(grep -r " le \| la \| les \| un \| une \| des " "$DOCS_DIR" --include="*.md" -l 2>/dev/null | wc -l | tr -d ' ')
    echo -e "${YELLOW}Files with French content:${NC} $french_files"
    
    # Count translation commits
    commits=$(git log --oneline --grep="translate\|translation" | wc -l | tr -d ' ')
    echo -e "${GREEN}Translation commits made:${NC} $commits"
    
    # Calculate rough percentage
    if [ "$total_files" -gt 0 ]; then
        completed=$((total_files - french_files))
        percentage=$((completed * 100 / total_files))
        echo -e "${BLUE}Estimated completion:${NC} ~$percentage%"
    fi
    
    echo ""
    echo -e "${YELLOW}Note:${NC} This is a rough estimate based on French articles detection"
}

# List files with French content
list_french_files() {
    echo -e "${BLUE}=== Files with Remaining French Content ===${NC}\n"
    
    # Find files with French articles and count occurrences
    echo "Scanning for French content..."
    echo ""
    
    while IFS= read -r file; do
        count=$(grep -o " le \| la \| les \| un \| une \| des " "$file" 2>/dev/null | wc -l | tr -d ' ')
        if [ "$count" -gt 0 ]; then
            relative_path=${file#$PROJECT_ROOT/}
            echo -e "${YELLOW}$relative_path${NC} - ~$count French occurrences"
        fi
    done < <(find "$DOCS_DIR" -name "*.md" -type f)
}

# Show detailed statistics
show_stats() {
    echo -e "${BLUE}=== Detailed Translation Statistics ===${NC}\n"
    
    # Files by category
    echo "Files by category:"
    for dir in architecture cost-economics infrastructure performance security use-cases; do
        if [ -d "$DOCS_DIR/$dir" ]; then
            count=$(find "$DOCS_DIR/$dir" -name "*.md" -type f | wc -l | tr -d ' ')
            french=$(grep -r " le \| la \| les " "$DOCS_DIR/$dir" --include="*.md" -l 2>/dev/null | wc -l | tr -d ' ')
            echo -e "  $dir: ${GREEN}$count files${NC}, ${YELLOW}$french with French${NC}"
        fi
    done
    
    echo ""
    echo "Recent translation commits:"
    git log --oneline --grep="translate\|translation" -5
    
    echo ""
    echo "Lines changed in translation work:"
    git log --grep="translate\|translation" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2 } END { printf "  Added: %s lines\n  Removed: %s lines\n", add, subs }'
}

# Find common French patterns
find_patterns() {
    echo -e "${BLUE}=== Common French Patterns Found ===${NC}\n"
    
    echo "Most common French words still present:"
    echo ""
    
    # Find common French words
    grep -roh "\b\(dans\|avec\|pour\|mais\|plus\|très\|tous\|tout\|cette\|permet\|permet\|nécessite\|utilise\)\b" "$DOCS_DIR" --include="*.md" 2>/dev/null | \
        sort | uniq -c | sort -rn | head -10
    
    echo ""
    echo "Files needing most work (top 5):"
    for file in $(find "$DOCS_DIR" -name "*.md" -type f); do
        count=$(grep -o " le \| la \| les \| un \| une \| des " "$file" 2>/dev/null | wc -l | tr -d ' ')
        if [ "$count" -gt 0 ]; then
            relative_path=${file#$PROJECT_ROOT/}
            echo "$count $relative_path"
        fi
    done | sort -rn | head -5 | while read count path; do
        echo -e "  ${YELLOW}$path${NC} - $count occurrences"
    done
}

# Create backup
create_backup() {
    backup_dir="$PROJECT_ROOT/backups"
    timestamp=$(date +%Y%m%d_%H%M%S)
    backup_file="$backup_dir/docs_backup_$timestamp.tar.gz"
    
    mkdir -p "$backup_dir"
    
    echo -e "${BLUE}Creating backup...${NC}"
    tar -czf "$backup_file" -C "$PROJECT_ROOT" docs/
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Backup created:${NC} $backup_file"
        ls -lh "$backup_file"
    else
        echo -e "${RED}Backup failed${NC}"
        exit 1
    fi
}

# Test mkdocs build
test_build() {
    echo -e "${BLUE}=== Testing MkDocs Build ===${NC}\n"
    
    if ! command -v mkdocs &> /dev/null; then
        echo -e "${RED}mkdocs not found${NC}"
        echo "Install with: pip install mkdocs-material"
        exit 1
    fi
    
    cd "$PROJECT_ROOT"
    
    echo "Building documentation..."
    if mkdocs build --strict 2>&1 | tee /tmp/mkdocs-build.log; then
        echo -e "\n${GREEN}Build successful!${NC}"
    else
        echo -e "\n${RED}Build failed. Check /tmp/mkdocs-build.log${NC}"
        exit 1
    fi
}

# Main script logic
case "${1:-}" in
    check)
        check_progress
        ;;
    list-french)
        list_french_files
        ;;
    stats)
        show_stats
        ;;
    find-patterns)
        find_patterns
        ;;
    backup)
        create_backup
        ;;
    test-build)
        test_build
        ;;
    help|--help|-h)
        show_usage
        ;;
    *)
        show_usage
        exit 1
        ;;
esac
