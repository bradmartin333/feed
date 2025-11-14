# Feed

A production-ready GitLab Pages site powered by Typst, compiled to HTML using Typst 0.14's experimental HTML features.

## Overview

This repository contains a well-organized Typst project that compiles to a static HTML site hosted on GitLab Pages. The project structure is designed for maintainability and scalability.

## Project Structure

```
.
├── .gitlab-ci.yml          # GitLab CI/CD configuration
├── .gitignore              # Ignore build artifacts
├── README.md               # This file
└── typst/                  # Typst project directory
    ├── main.typ            # Main document source
    └── templates/          # Reusable templates
        └── base.typ        # Base template for HTML output
```

## Features

- **Well-Organized Structure**: Separate directories for source files and templates
- **Automatic Deployment**: GitLab CI/CD automatically compiles and deploys changes
- **Template System**: Reusable templates for consistent styling
- **HTML Output**: Uses Typst 0.14's experimental `--features html` flag
- **Production-Ready**: Includes proper .gitignore and CI/CD setup

## Getting Started

### Prerequisites

- Typst 0.14 or later (with HTML feature support)
- GitLab repository with Pages enabled

### Local Development

To compile the document locally:

```bash
# Install Typst 0.14 or later
# See https://github.com/typst/typst for installation instructions

# Compile to HTML
typst compile --features html typst/main.typ index.html
```

### Editing Content

1. Edit `typst/main.typ` to update the main content
2. Modify templates in `typst/templates/` for styling changes
3. Add new Typst files in the `typst/` directory as needed

### Creating New Templates

Create new template files in `typst/templates/` and import them in your documents:

```typst
#import "templates/your-template.typ": *
```

## Deployment

The site is automatically deployed to GitLab Pages when changes are pushed to the main branch:

1. Commit your changes
2. Push to the main/master branch
3. GitLab CI compiles the Typst document to HTML
4. The HTML is deployed to GitLab Pages

The compiled HTML will be available at your GitLab Pages URL (typically `https://username.gitlab.io/feed`).

## CI/CD Pipeline

The `.gitlab-ci.yml` file defines two jobs:

- **pages**: Compiles and deploys to GitLab Pages (main branch only)
- **check**: Validates compilation on feature branches

## Maintenance

### Adding Content

- Edit `typst/main.typ` for new content
- Create separate `.typ` files for larger sections
- Use imports to keep the main file clean

### Updating Templates

- Modify files in `typst/templates/`
- Templates are reusable across multiple documents
- Changes to templates affect all documents that use them

### Troubleshooting

- Check GitLab CI/CD logs if deployment fails
- Ensure Typst 0.14+ is being used (check `.gitlab-ci.yml` image version)
- Verify the `--features html` flag is supported

## Technical Details

- **Typst Version**: 0.14.0 (via Docker image)
- **HTML Feature**: Experimental `--features html` flag
- **Deployment**: GitLab Pages via CI/CD
- **Artifacts**: HTML output in `public/` directory

## Contributing

To contribute:

1. Create a feature branch
2. Make your changes
3. Test compilation locally
4. Submit a merge request

## License

[Add your license information here]

## Resources

- [Typst Documentation](https://typst.app/docs)
- [GitLab Pages Documentation](https://docs.gitlab.com/ee/user/project/pages/)
- [Typst HTML Features](https://github.com/typst/typst/releases/tag/v0.14.0)