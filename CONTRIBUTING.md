# Contributing Guide

Thank you for your interest in contributing to this project! This guide will help you get started.

## Project Overview

This is a GitLab Pages site powered by Typst, using the experimental HTML output feature introduced in Typst 0.14. The project is designed to be maintainable and production-ready.

## Development Setup

### Prerequisites

- **Typst 0.14+**: Install from [typst.app](https://typst.app) or [GitHub](https://github.com/typst/typst)
- **Git**: For version control
- **Text Editor**: Any editor with Typst support (VS Code with Typst LSP recommended)

### Getting Started

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd feed
   ```

2. Verify the setup:
   ```bash
   ./validate.sh
   ```

3. Test local compilation:
   ```bash
   typst compile --features html typst/main.typ index.html
   ```

## Project Structure

```
feed/
├── .gitlab-ci.yml          # CI/CD configuration
├── .gitignore              # Git ignore rules
├── README.md               # Main documentation
├── CONTRIBUTING.md         # This file
├── VALIDATION.md           # Validation guide
├── validate.sh             # Validation script
└── typst/                  # Typst project root
    ├── main.typ            # Main document
    ├── templates/          # Reusable templates
    │   └── base.typ        # Base HTML template
    └── examples/           # Example documents
        └── simple.typ      # Simple example
```

## Making Changes

### Editing Content

1. **Main Content**: Edit `typst/main.typ`
2. **Templates**: Modify files in `typst/templates/`
3. **Examples**: Add new examples in `typst/examples/`

### Adding New Templates

Create a new file in `typst/templates/`:

```typst
// typst/templates/article.typ
#let article(title: none, authors: (), body) = {
  // Your template code here
  body
}
```

Import and use in your documents:

```typst
#import "templates/article.typ": *
#show: article.with(title: "My Article", authors: ("Author",))
```

### Testing Changes

1. **Local Testing**:
   ```bash
   typst compile --features html typst/main.typ index.html
   ```

2. **Validation**:
   ```bash
   ./validate.sh
   ```

3. **Visual Check**: Open the generated `index.html` in a browser

## Contribution Workflow

### 1. Create a Branch

```bash
git checkout -b feature/your-feature-name
```

### 2. Make Changes

- Keep changes focused and minimal
- Follow existing code style
- Test thoroughly

### 3. Commit Changes

Use clear, descriptive commit messages:

```bash
git add .
git commit -m "Add: Brief description of changes"
```

Commit message prefixes:
- `Add:` - New features or files
- `Fix:` - Bug fixes
- `Update:` - Modifications to existing content
- `Docs:` - Documentation changes
- `Refactor:` - Code restructuring

### 4. Push and Create Merge Request

```bash
git push origin feature/your-feature-name
```

Then create a merge request on GitLab.

## Code Style Guidelines

### Typst Files

- Use 2 spaces for indentation
- Include comments for complex logic
- Keep functions focused and single-purpose
- Use descriptive variable names

### Template Design

- Make templates reusable and configurable
- Provide sensible defaults
- Document parameters in comments
- Test with various inputs

### Example

```typst
// Good: Clear, documented, reusable
#let card(
  title: none,      // Card title (optional)
  color: blue,      // Border color
  body              // Card content
) = {
  rect(
    stroke: color,
    [
      #if title != none [
        *#title*
      ]
      #body
    ]
  )
}

// Usage
#card(title: "Example")[Content here]
```

## Testing Guidelines

Before submitting changes:

1. ✅ Run `./validate.sh` successfully
2. ✅ Compile all documents without errors
3. ✅ Check HTML output in a browser
4. ✅ Verify templates work with different inputs
5. ✅ Ensure no build artifacts are committed

## CI/CD Pipeline

The pipeline runs automatically on push:

### Branches (except main/master)
- Runs `check` job to validate compilation

### Main/Master Branch
- Runs `pages` job to deploy to GitLab Pages
- Creates artifacts in `public/` directory

Monitor pipeline status in GitLab CI/CD section.

## Common Issues

### Compilation Errors

**Issue**: `unknown flag: --features`
- **Solution**: Upgrade to Typst 0.14+

**Issue**: Template not found
- **Solution**: Check import paths are relative to the importing file

**Issue**: HTML output missing styles
- **Solution**: Verify template configurations for HTML compatibility

### CI/CD Issues

**Issue**: Pipeline fails but local compilation works
- **Solution**: Ensure Docker image version matches local Typst version

**Issue**: Pages not updating
- **Solution**: Check pipeline ran on main/master branch

## Questions?

- Check [VALIDATION.md](VALIDATION.md) for troubleshooting
- Review [README.md](README.md) for project overview
- Open an issue for bugs or feature requests

## License

By contributing, you agree that your contributions will be licensed under the same license as the project.

## Thank You!

Your contributions help make this project better for everyone!
