// Base template for HTML output
// This template provides a consistent structure for all documents

#let base(
  title: "Document",
  author: none,
  body
) = {
  // Set document metadata
  set document(
    title: title,
    author: author,
  )
  
  // Configure text properties
  set text(
    size: 11pt,
    font: "Linux Libertine",
  )
  
  // Configure page properties
  set page(
    paper: "a4",
    margin: (x: 2cm, y: 2cm),
  )
  
  // Configure paragraphs
  set par(
    justify: true,
    leading: 0.65em,
  )
  
  // Configure headings
  set heading(
    numbering: "1.1",
  )
  
  // Title block
  if title != none {
    align(center)[
      #text(size: 24pt, weight: "bold")[#title]
    ]
  }
  
  if author != none {
    align(center)[
      #text(size: 12pt)[#author]
    ]
  }
  
  if title != none or author != none {
    v(1em)
  }
  
  // Document body
  body
}
