html
  head
    s"Example application" title
    s"utf-8" charset meta
  body \ embedded in html BUT not in head
    10 10 grid
      1 'x 1 'y s"Hello there" 'value button \ attributes begin with '
      2 'x 2 'y 10 'maxlen input
      div \ sequence
      div
      div
      div div div \ embedded