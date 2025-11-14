#import "templates/base.typ": *

#show: base.with(
  title: "Feed",
  author: "Brad Martin",
)

= Welcome to Feed

This is a production-ready Typst project compiled to HTML using Typst 0.14's experimental HTML features.

== Features

- Well-organized project structure
- Reusable templates
- GitLab Pages deployment
- Automatic compilation via CI/CD

== Getting Started

This document is automatically compiled from the `typst/` directory structure and deployed to GitLab Pages.

=== Project Structure

The project follows a maintainable structure:

- `typst/main.typ` - Main document source
- `typst/templates/` - Reusable templates
- `.gitlab-ci.yml` - CI/CD configuration for automatic deployment

== Content Management

Add your content to the `typst/main.typ` file or create additional sections by importing them from separate files in the `typst/` directory.

=== Example Section

This is an example of how content can be structured in Typst. You can use:

- *Bold text*
- _Italic text_
- `Code snippets`
- #link("https://example.com")[Links]

== Maintenance

To update the site:

1. Edit files in the `typst/` directory
2. Commit and push changes
3. GitLab CI will automatically compile and deploy

The compilation uses the experimental `--features html` flag available in Typst 0.14.
