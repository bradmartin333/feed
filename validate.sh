#!/bin/bash
# Validation script for the GitLab Pages Typst setup

set -e

echo "==================================="
echo "GitLab Pages Typst Setup Validator"
echo "==================================="
echo ""

# Check if Typst is installed
echo "Checking for Typst installation..."
if ! command -v typst &> /dev/null; then
    echo "❌ Typst is not installed or not in PATH"
    echo "Please install Typst 0.14 or later: https://github.com/typst/typst"
    exit 1
fi

# Check Typst version
TYPST_VERSION=$(typst --version | grep -oP '\d+\.\d+\.\d+' | head -1)
echo "✓ Typst version: $TYPST_VERSION"

# Verify version is 0.14 or higher
if ! printf '%s\n' "0.14.0" "$TYPST_VERSION" | sort -V -C; then
    echo "⚠ Warning: Typst version should be 0.14.0 or higher for HTML feature support"
fi

echo ""
echo "Validating project structure..."

# Check required files
REQUIRED_FILES=(
    ".gitlab-ci.yml"
    ".gitignore"
    "README.md"
    "typst/main.typ"
    "typst/templates/base.typ"
    "typst/examples/simple.typ"
)

for file in "${REQUIRED_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo "✓ $file exists"
    else
        echo "❌ $file is missing"
        exit 1
    fi
done

echo ""
echo "Testing compilation..."

# Test main document compilation
echo "Compiling typst/main.typ..."
if typst compile --features html typst/main.typ index.html 2>&1; then
    echo "✓ Main document compiled successfully"
    
    # Check if output file exists and has content
    if [ -f "index.html" ] && [ -s "index.html" ]; then
        SIZE=$(du -h index.html | cut -f1)
        echo "✓ Generated index.html ($SIZE)"
        
        # Clean up test output
        rm index.html
    else
        echo "❌ index.html was not created or is empty"
        exit 1
    fi
else
    echo "❌ Failed to compile main document"
    exit 1
fi

echo ""
echo "Testing example document..."
if typst compile --features html typst/examples/simple.typ example.html 2>&1; then
    echo "✓ Example document compiled successfully"
    
    if [ -f "example.html" ] && [ -s "example.html" ]; then
        SIZE=$(du -h example.html | cut -f1)
        echo "✓ Generated example.html ($SIZE)"
        rm example.html
    fi
else
    echo "⚠ Example document compilation had issues (non-critical)"
fi

echo ""
echo "==================================="
echo "✓ All validations passed!"
echo "==================================="
echo ""
echo "Next steps:"
echo "1. Push changes to GitLab"
echo "2. Check CI/CD pipeline status"
echo "3. Access your site at your GitLab Pages URL"
echo ""
