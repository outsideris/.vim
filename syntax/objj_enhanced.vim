" Author:       Michael Sanders (msanders42 [at] gmail [dot] com)
" Description:  Better syntax highlighting for Objective-C files (part of the
"               cocoa.vim plugin).
" Last Updated: June 23, 2009

" NOTE:    This next file (cocoa_keywords.vim) is rather large and may slow
"          things down. Loading it seems to take less than 0.5 microseconds
"          on my machine, but I'm not sure of the consequences; if it is slow
"          for you, just comment out the next line.
"ru after/syntax/cocoa_keywords.vim

syn match objjDirective '@synthesize\|@property\|@optional\|@required' display
syn keyword objjType IBOutlet IBAction Method
syn keyword objjConstant YES NO TRUE FALSE

syn region objjImp start='@implementation' end='@end' transparent
syn region objjHeader start='@interface' end='@end' transparent

" I make this typo sometimes so it's nice to have it highlighted.
syn match objjError '\v(NSLogv=\(\s*)@<=[^@]=["'].*'me=e-1

syn match objjSubclass '\(@implementation\|@interface\)\@<=\s*\k\+' display contained containedin=objjImp,objjHeader
syn match objjSuperclass '\(@\(implementation\|interface\)\s*\k\+\s*:\)\@<=\s*\k*' display contained containedin=objjImp,objjHeader

" Matches "- (void) foo: (int) bar and: (float) foobar"
syn match objjMethod '^\s*[-+]\s*\_.\{-}[\{;]'me=e-1 transparent contains=cParen,objjInstMethod,objjFactMethod
" Matches "bar & foobar" in above
syn match objjMethodArg ')\@<=\s*\k\+' contained containedin=objjMethod
" Matches "foo:" & "and:" in above
syn match objjMethodName '\(^\s*[-+]\s*(\_[^)]*)\)\@<=\_\s*\_\k\+' contained containedin=objjMethod
syn match objjMethodColon '\k\+\s*:' contained containedin=objjMethod
" Don't match these groups in cParen "(...)"
syn cluster cParenGroup add=objjMethodName,objjMethodArg,objjMethodColon
" This fixes a bug with completion inside parens (e.g. if ([NSString ]))
syn cluster cParenGroup remove=objjMessage

" Matches "bar" in "[NSObject bar]" or "bar" in "[[NSObject foo: baz] bar]",
" but NOT "bar" in "[NSObject foo: bar]".
syn match objjMessageName '\(\[\s*\k\+\s\+\|\]\s*\)\@<=\k*\s*\]'me=e-1 display contained containedin=objjMessage
" Matches "foo:" in "[NSObject foo: bar]" or "[[NSObject new] foo: bar]"
syn match objjMessageColon '\(\_\S\+\_\s\+\)\@<=\k\+\s*:' display contained containedin=objjMessage

" Don't match these in this strange group for edge cases...
syn cluster cMultiGroup add=objjMessageColon,objjMessageName,objjMethodName,objjMethodArg,objjMethodColon

" You may want to customize this one. I couldn't find a default group to suit
" it, but you can modify your colorscheme to make this a different color.
hi link objjMethodName Special
hi link objjMethodColon objjMethodName

hi link objjMethodArg Identifier

hi link objjMessageName objjMethodArg
hi link objjMessageColon objjMessageName

hi link objjSubclass objjMethodName
hi link objjSuperclass String

hi link objjError Error
