"        $URL$

au BufRead,BufNewFile *.j set filetype=objj
au Syntax objj source ~/.vim/syntax/objj_enhanced.vim
au Syntax objj source ~/.vim/syntax/objj_keywords.vim