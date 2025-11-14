# Feed

A GitHub Pages site powered by Typst, compiled to HTML using Typst 0.14's experimental HTML features.

## Getting Started

### Prerequisites

- Typst 0.14 or later (with HTML feature support)
- GitHub repository with Pages enabled

### Quick Start

1. **Install Typst 0.14+**: See [typst.app](https://typst.app) for installation instructions
   ```bash
   typst --version  # Should show 0.14.0 or higher
   ```

1. **Compile locally**:
   ```bash
   typst compile --features html typst/main.typ index.html
   ```
   ```bash
   typst compile --features html typst/examples/simple.typ example.html --root typst
   ```

1. **View the output**: Open the compiled `index.html` or `example.html` in your browser

### Editing Content

1. Edit `typst/main.typ` to update the main content
2. Modify templates in `typst/templates/` for styling changes
3. Add new Typst files in the `typst/` directory as needed
