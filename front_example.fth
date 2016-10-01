: html ;
: >> ;
: << ;
: head ;
: title ;
: grid ;
: 'x ;
: 'y ;
: 'charset ;
: meta ;
: 'value ;
: body ;
: button ;
: input ;
: 'maxlen ;
: div ;

html >> \ >> after a tag means next tag is embedded
  head >>
    s" Example application" title
    s" utf-8" 'charset meta <<
  body >>
    10 10 grid
      1 'x 1 'y s" Hello there" 'value button \ attributes begin with ' and come before tag
      2 'x 2 'y 10 'maxlen input
      div
      div
      div
      div >> div >> div \ embedding
      << << \ going 2 levels out
      div \ this div will be clild of grid