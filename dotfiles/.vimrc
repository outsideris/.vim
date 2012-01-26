set nocompatible    " 오리지날vi랑 호환안함 
"set autoindent 		" 자동 들여쓰기
set cindent 	     	" C 프로그래밍을 할때 자동 들여쓰기
set smartindent   	" 좀더 똑똑한 들여쓰기
set wrap 			 
set nowrapscan 	  	" 검색할 때 문서의 끝에서 처음 돌아가지 않는다.
set nobackup 		    " 백업 파일 만들지 않는다.
set visualbell 		  " 키를 잘못눌렀을 때 삑 소리를 내는 대신 번쩍이게 한다.
set ruler 			    " 화면 우측 하단에 현재 커서의 위치(줄,칸)를 보여준다.
set shiftwidth=2   	" 자동 들여쓰기를 할때 2칸 들여쓰도록 한다.
set number 			    " 행번호를 사용한다. 약어 = nu
set fencs=ucs-bom,utf-8,euc-kr.latin1 " 한글 파일은 euc-kr로 읽어들이며, 유니코드는 유니코드로 읽어들이도록 설정
set fileencoding=utf-8 " 실제로 파일을 저장할때 사용되는 인코딩은 utf-8
set tenc=utf-8      " 터미널 인코딩
set background=dark " 하이라이팅 옵션 lihgt or dark
set expandtab 		  " 탭을 입력하면 공백문자로 변환하는 기능을 설정
set hlsearch 		    " 검색어를 구문강조해주는 기능 약어 = hls
set ignorecase 		  " 검색할 때 대소문자 무시하도록 하는 것  약어 = ic
set tabstop=2 		  " 탭 간격을 2칸으로 지정
set linebreak
set incsearch    		" 키워드를 입력할 때마다 검색하는 점진 검색사용
set backspace=eol,start,indent "  줄의 끝, 시작, 들여쓰기에서 백스페이스를 사용하면 이전줄과 연결됨
set history=1000    " vi 편집기록을 1,000까지 기억함
set undolevels=1000 " 1000 undos

" backup
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/backup/tmp

set cul                                           " highlight current line
hi CursorLine term=none cterm=none ctermbg=3      " adjust color

colorscheme desert  "  vi 색상 테마를 evening로 설정
syntax on 		    	"  구문강조 기능 사용

filetype indent on  "  파일 종류에 따라 구문을 강조

" 탭사용시 | 로 표시함
"set list
"set lcs=tab:\|\ 

filetype plugin on
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!

" pathongen 사용
call pathogen#infect()

" nodejs-errorformat 커맨드
nmap <Leader><Leader> :w<CR>:make! \| botright cwindow<CR>
