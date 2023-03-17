set nu
syntax on
set hlsearch
"set shiftwidth=4
"set softtabstop=4
"set tabstop=4
"set expandtab
"set fdm=indent
set autoindent
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,gb2312,latin1
set encoding=utf-8
set cul
set foldlevelstart=99
autocmd BufNewFile *.py,*.pl,*.r,*.sh exec ":call SetTitle()"
autocmd BufNewFile *.c,*.cpp exec ":call SetTitle2()"
func SetTitle()

call append(0, "\#################################################")
call append(1,"\#  File Name:".expand("%"))
call append(2,"\#  Author: Pengwei.Xing")
call append(3,"\#  Mail: xingwei421@qq.com,pengwei.xing@igp.uu.se,xpw1992@gmail.com")
call append(4,"\#  Created Time: ".strftime("%c"))
call append(5,"\#################################################")
call append(6,"")
let g:pydiction_location = '~/.vim/tools/pydiction/complete-dict'
endfunc

func SetTitle2()

call append(0, "\//################################################")
call append(1,"\//  File Name:".expand("%"))
call append(2,"\//  Author: Pengwei.Xing")
call append(3,"\//  Mail: xingwei421@qq.com,pengwei.xing@igp.uu.se,xpw1992@gmail.com")
call append(4,"\//  Created Time: ".strftime("%c"))
call append(5,"\//################################################")
call append(6,"")
endfunc

autocmd BufNewFile * normal G
filetype plugin on
autocmd FileType python set omnifunc=pythoncomplete#Complete
