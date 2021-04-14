
syn case match

syn keyword     goPackage           package
syn keyword     goImport            import    contained
syn keyword     goVar               var       contained
syn keyword     goConst             const     contained

hi def link     goPackage           Statement
hi def link     goImport            Statement
hi def link     goVar               Keyword
hi def link     goConst             Keyword
hi def link     goDeclaration       Keyword

" Keywords within functions
syn keyword     goStatement         defer go goto return break continue fallthrough
syn keyword     goConditional       if else switch select
syn keyword     goLabel             case default
syn keyword     goRepeat            for range

hi def link     goStatement         Statement
hi def link     goConditional       Conditional
hi def link     goLabel             Label
hi def link     goRepeat            Repeat

" Predefined types
syn keyword     goType              chan map bool string error
syn keyword     goSignedInts        int int8 int16 int32 int64 rune
syn keyword     goUnsignedInts      byte uint uint8 uint16 uint32 uint64 uintptr
syn keyword     goFloats            float32 float64
syn keyword     goComplexes         complex64 complex128

hi def link     goType              Type
hi def link     goSignedInts        Type
hi def link     goUnsignedInts      Type
hi def link     goFloats            Type
hi def link     goComplexes         Type

" Predefined functions and values
syn keyword     goBuiltins                 append cap close complex copy delete imag len
syn keyword     goBuiltins                 make new panic print println real recover
syn keyword     goBoolean                  true false
syn keyword     goPredefinedIdentifiers    nil iota

hi def link     goBuiltins                 Identifier
hi def link     goBoolean                  Boolean
hi def link     goPredefinedIdentifiers    goBoolean

" Comments; their contents
syn keyword     goTodo              contained TODO FIXME XXX BUG
syn cluster     goCommentGroup      contains=goTodo

syn region      goComment           start="//" end="$" contains=goGenerate,@goCommentGroup,@Spell
syn region    goComment           start="/\*" end="\*/" contains=@goCommentGroup,@Spell

hi def link     goComment           Comment
hi def link     goTodo              Todo

" Go escapes
syn match       goEscapeOctal       display contained "\\[0-7]\{3}"
syn match       goEscapeC           display contained +\\[abfnrtv\\'"]+
syn match       goEscapeX           display contained "\\x\x\{2}"
syn match       goEscapeU           display contained "\\u\x\{4}"
syn match       goEscapeBigU        display contained "\\U\x\{8}"
syn match       goEscapeError       display contained +\\[^0-7xuUabfnrtv\\'"]+

syn match       goError              /\<err\>/
hi def link     goError             Error

hi def link     goEscapeOctal       goSpecialString
hi def link     goEscapeC           goSpecialString
hi def link     goEscapeX           goSpecialString
hi def link     goEscapeU           goSpecialString
hi def link     goEscapeBigU        goSpecialString
hi def link     goSpecialString     Special
hi def link     goEscapeError       Error

" Strings and their contents
syn cluster     goStringGroup       contains=goEscapeOctal,goEscapeC,goEscapeX,goEscapeU,goEscapeBigU,goEscapeError
syn region      goString            start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=@goStringGroup
syn region      goRawString         start=+`+ end=+`+

hi def link     goString            String
hi def link     goRawString         String

" Characters; their contents
syn cluster     goCharacterGroup    contains=goEscapeOctal,goEscapeC,goEscapeX,goEscapeU,goEscapeBigU
syn region      goCharacter         start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=@goCharacterGroup

hi def link     goCharacter         Character

" Regions
syn region      goParen             start='(' end=')' transparent
syn region    goBlock             start="{" end="}" transparent

" import
syn region    goImport            start='import (' end=')' transparent contains=goImport,goString,goComment

" var, const
syn region    goVar               start='var ('   end='^\s*)$' transparent
                        \ contains=ALLBUT,goParen,goBlock,goFunction,goTypeName,goReceiverType,goReceiverVar,goParamName,goParamType,goSimpleParams,goPointerOperator
syn region    goConst             start='const (' end='^\s*)$' transparent
                        \ contains=ALLBUT,goParen,goBlock,goFunction,goTypeName,goReceiverType,goReceiverVar,goParamName,goParamType,goSimpleParams,goPointerOperator

" Single-line var, const, and import.
syn match       goSingleDecl        /\%(import\|var\|const\) [^(]\@=/ contains=goImport,goVar,goConst

" Integers
syn match       goDecimalInt        "\<-\=\(0\|[1-9]_\?\(\d\|\d\+_\?\d\+\)*\)\%([Ee][-+]\=\d\+\)\=\>"
syn match       goDecimalError      "\<-\=\(_\(\d\+_*\)\+\|\([1-9]\d*_*\)\+__\(\d\+_*\)\+\|\([1-9]\d*_*\)\+_\+\)\%([Ee][-+]\=\d\+\)\=\>"
syn match       goHexadecimalInt    "\<-\=0[xX]_\?\(\x\+_\?\)\+\>"
syn match       goHexadecimalError  "\<-\=0[xX]_\?\(\x\+_\?\)*\(\([^ \t0-9A-Fa-f_]\|__\)\S*\|_\)\>"
syn match       goOctalInt          "\<-\=0[oO]\?_\?\(\o\+_\?\)\+\>"
syn match       goOctalError        "\<-\=0[0-7oO_]*\(\([^ \t0-7oOxX_/)\]\}\:]\|[oO]\{2,\}\|__\)\S*\|_\|[oOxX]\)\>"
syn match       goBinaryInt         "\<-\=0[bB]_\?\([01]\+_\?\)\+\>"
syn match       goBinaryError       "\<-\=0[bB]_\?[01_]*\([^ \t01_]\S*\|__\S*\|_\)\>"

hi def link     goDecimalInt        Integer
hi def link     goDecimalError      Error
hi def link     goHexadecimalInt    Integer
hi def link     goHexadecimalError  Error
hi def link     goOctalInt          Integer
hi def link     goOctalError        Error
hi def link     goBinaryInt         Integer
hi def link     goBinaryError       Error
hi def link     Integer             Number

" Floating point
syn match       goFloat             "\<-\=\d\+\.\d*\%([Ee][-+]\=\d\+\)\=\>"
syn match       goFloat             "\<-\=\.\d\+\%([Ee][-+]\=\d\+\)\=\>"

hi def link     goFloat             Float

" Imaginary literals
syn match       goImaginary         "\<-\=\d\+i\>"
syn match       goImaginary         "\<-\=\d\+[Ee][-+]\=\d\+i\>"
syn match       goImaginaryFloat    "\<-\=\d\+\.\d*\%([Ee][-+]\=\d\+\)\=i\>"
syn match       goImaginaryFloat    "\<-\=\.\d\+\%([Ee][-+]\=\d\+\)\=i\>"

hi def link     goImaginary         Number
hi def link     goImaginaryFloat    Float


hi def link     goExtraType         Type
hi def link     goSpaceError        Error



" included from: https://github.com/athom/more-colorful.vim/blob/master/after/syntax/go.vim
"
" Comments; their contents
syn keyword     goTodo              contained NOTE
hi def link     goTodo              Todo

syn match goVarArgs /\.\.\./

" Operators;
hi def link     goOperator          Operator

" Functions;
syn keyword goDeclaration func
hi def link     goFunction          Function

" Function calls;
hi def link     goFunctionCall      Type

" Fields;
hi def link    goField              Identifier

" Structs & Interfaces;
syn keyword goDeclType           struct interface
syn keyword goDeclaration        type
hi def link     goTypeConstructor   Type
hi def link     goTypeName          Type
hi def link     goTypeDecl          Keyword
hi def link     goDeclType          Keyword

" :GoCoverage commands
hi def link goCoverageNormalText Comment

function! s:hi()
  hi def link goSameId Search
  hi def link goDiagnosticError SpellBad
  hi def link goDiagnosticWarning SpellRare

  " TODO(bc): is it appropriate to define text properties in a syntax file?
  " The highlight groups need to be defined before the text properties types
  " are added, and when users have syntax enabled in their vimrc after
  " filetype plugin on, the highlight groups won't be defined when
  " ftplugin/go.vim is executed when the first go file is opened.
  " See https://github.com/fatih/vim-go/issues/2658.
  if has('textprop')
    if empty(prop_type_get('goSameId'))
      call prop_type_add('goSameId', {'highlight': 'goSameId'})
    endif
    if empty(prop_type_get('goDiagnosticError'))
      call prop_type_add('goDiagnosticError', {'highlight': 'goDiagnosticError'})
    endif
    if empty(prop_type_get('goDiagnosticWarning'))
      call prop_type_add('goDiagnosticWarning', {'highlight': 'goDiagnosticWarning'})
    endif
  endif

  hi def link goDeclsFzfKeyword        Keyword
  hi def link goDeclsFzfFunction       Function
  hi def link goDeclsFzfSpecialComment SpecialComment
  hi def link goDeclsFzfComment        Comment

  " :GoCoverage commands
  hi def      goCoverageCovered    ctermfg=green guifg=#A6E22E
  hi def      goCoverageUncover    ctermfg=red guifg=#F92672

  " :GoDebug commands
endfunction

augroup vim-go-hi
  autocmd!
  autocmd ColorScheme * call s:hi()
augroup end
call s:hi()

" Search backwards for a global declaration to start processing the syntax.
"syn sync match goSync grouphere NONE /^\(const\|var\|type\|func\)\>/

" There's a bug in the implementation of grouphere. For now, use the
" following as a more expensive/less precise workaround.
syn sync minlines=500

let b:current_syntax = "go"

" vim: sw=2 ts=2 et
