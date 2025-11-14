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
  
  // Document body
  body
}
