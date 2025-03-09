" clingo.vim
" Basic syntax highlighting for Clingo (Answer Set Programming)

if exists("b:current_syntax")
  finish
endif

" Keywords
syntax keyword clingoKeyword rule fact base head body not

" Comments
syntax match clingoComment "%.*$"

" Constants
syntax match clingoConstant "\<\d\+\>"

" Variables
syntax match clingoVariable "\<[A-Z][a-zA-Z0-9_]*\>"

" Operators
syntax match clingoOperator ":-"
syntax match clingoOperator "not"
syntax match clingoOperator "\.\s*$"

" Strings
syntax region clingoString start=+"+ end=+"+

" Highlighting
highlight link clingoKeyword Keyword
highlight link clingoComment Comment
highlight link clingoConstant Constant
highlight link clingoVariable Identifier
highlight link clingoOperator Operator
highlight link clingoString String

let b:current_syntax = "clingo"
