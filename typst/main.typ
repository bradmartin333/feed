#import "templates/base.typ": *

#show: base.with(
  title: "Feed",
  author: "Brad Martin",
)

= Welcome to Feed

This is a Typst project compiled to HTML using Typst 0.14's experimental HTML features.

== Features

- GitHub Pages deployment
- Automatic compilation via GitHub Actions

== Getting Started

This document is automatically compiled from the `typst/` directory structure and deployed to GitHub Pages.

=== Project Structure

The project follows a maintainable structure:

- `typst/main.typ` - Main document source
- `typst/templates/` - Reusable templates
- `.github/workflows/pages.yml` - GitHub Actions workflow for automatic deployment

== Content Management

Add your content to the `typst/main.typ` file or create additional sections by importing them from separate files in the `typst/` directory.

=== Example Section

This is an example of how content can be structured in Typst. You can use:

- *Bold text*
- _Italic text_
- `Code snippets`
- #link("https://example.com")[Links]
