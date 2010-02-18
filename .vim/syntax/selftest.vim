" Vim syntax file
" Language:    Opera Selftest
" Maintainer:  Johannes Hoff <jhoff@opera.com>
" Last Change: 2009 June 2009

if exists("b:current_syntax")
  finish
endif

runtime! syntax/cpp.vim

syn keyword otFunction verify
syn keyword otKeyword include require group
syn keyword otStruct test global

" Opera keywords
syn keyword	cType uni_char BOOL

hi def link otFunction Function
hi def link otKeyword Identifier
hi def link otStruct Structure

