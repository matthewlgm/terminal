" =============================================================================
" 初始配置
" =============================================================================
" 兼容模式
" VIM是VI的最流行的加强版。它在VI的基础上增加了很多功能，但就不与VI完全兼容了。set compatible 就是让VIM关闭所有扩展的功能，尽量模拟VI的行为。但这样就不应用VIM的很多强大功能，所以一般没有什么特殊需要的话（比如执行很老的VI脚本），都要在VIM的配置开始，写上set nocompatible，关闭兼容模式。由于这个选项是最最基础的选项，会连带很多其它选项发生变动（称作副作用），所以它必需是第一个设定的选项。
set nocompatible

" 文件类型检测
" 当你用VIM打开某种编程语言的文件时，会看到关键字、函数名等等高亮，这和filetype有关。
" 执行:filetype可以查看VIM的文件类型检测功能是否已打开，默认：detection:ON plugin:OFF indent:OFF。
" detection：默认打开，VIM对文件自动检测文件类型，可以用:set filetype查看当前文件是什么类型。 手动关闭:filetype off，通过set filetype=xxxx指定。另外可以在文件中指定，VIM会从文件的头几行自动扫描文件是否有声明文件的类型的代码，如在文件的行首加入# vim: filetype=python，/* vim: filetype=java */，的注释方式声明（不影响文件的编译），这样VIM不通过文件名也能检测出文件是什么类型了。
" plugin：默认关闭，如果plugin状态是ON，会在VIM的运行时环境目录下加载该类型相关的插件（通过执行 ftplugin 目录下的文件类型特定的脚本）。如为了让VIM更好的支持某种语言的编程，会下载一些该语言相关的插件，此时就必须设置plugin为ON，插件才会生效，设置方法就是:filetype plugin on。
" indent：不同类型文件有不同的缩进方式，比如Python就要求使用4个空格作为缩进，而c使用两个tab作为缩进，那么indent就可以为不同文件类型选择合适的缩进方式了（按indent目录下的脚本自动缩进，你可以在Vim的安装目录的indent目录下看到定义了很多缩进相关的脚本）。具体设置方法：filetype indent on。
" 以上三个参数，可以写成一行filetype plugin indent on
filetype plugin indent on

" 快捷键前缀
" <Leader>键，默认是'\'
let mapleader=","

" 自动缩进
" set autoindent：回车后自动缩进，继承上一行的缩进方式
set autoindent

" 文件搜索
" set incsearch：开启实时搜索，随着你输入查询字串，显示不同的搜索结果
" set ignorecase：搜索时大小写不敏感
set incsearch
set ignorecase


" =============================================================================
" VIM插件（使用vim-plug作为插件管理器)
" =============================================================================
call plug#begin()

" 启动界面
Plug 'mhinz/vim-startify'
" 主题配色
Plug 'joshdick/onedark.vim'
" 中文文档
Plug 'yianwillis/vimcdoc'

" 文件目录
Plug 'scrooloose/nerdtree'
" 状态栏条
Plug 'vim-airline/vim-airline'

" 自动补全
" coc-marketplace coc-go coc-snippets coc-pairs
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 片段补全
Plug 'honza/vim-snippets'

" 插件声明结束位置，插件声明全部放在此行上面
call plug#end()


" =============================================================================
" 主题配色插件配置：onedark.vim
" =============================================================================
" 语法高亮
" syntax on：开启语法高亮
syntax on
" colorscheme onedark：设置主题配色方案为onedark
colorscheme onedark


" =============================================================================
" 文件目录插件配置：nerdtree
" =============================================================================
" 设置打开的快捷键， 再按一次关闭
nnoremap <leader>b :NERDTreeToggle<CR>
" 导航目录展开的符号
let g:NERDTreeDirArrowExpandable = '▸'
" 导航目录关闭的符号
let g:NERDTreeDirArrowCollapsible = '▾'
" 默认显示行号
let NERDTreeShowLineNumbers=1
" 打开文件时是否显示目录， 1- 显示 0- 不显示
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=30
" 忽略某些文件的显示，定义隐藏指定文件或目录
let NERDTreeIgnore=['\.pyc','\~$','\.swp','\.git']


" =============================================================================
" 状态栏条插件配置：vim-airline
" =============================================================================
" 状态栏条主题
let g:airline_theme='onedark'

" 激活顶部Tab标签（buffer）
let g:airline#extensions#tabline#enabled = 1

" 设置切换Tab标签（buffer）的快捷键
let g:airline#extensions#tabline#buffer_idx_mode = 1
 nmap <leader>1 <Plug>AirlineSelectTab1
 nmap <leader>2 <Plug>AirlineSelectTab2
 nmap <leader>3 <Plug>AirlineSelectTab3
 nmap <leader>4 <Plug>AirlineSelectTab4
 nmap <leader>5 <Plug>AirlineSelectTab5
 nmap <leader>6 <Plug>AirlineSelectTab6
 nmap <leader>7 <Plug>AirlineSelectTab7
 nmap <leader>8 <Plug>AirlineSelectTab8
 nmap <leader>9 <Plug>AirlineSelectTab9
 nmap <leader>0 <Plug>AirlineSelectTab0
 nmap <leader>h <Plug>AirlineSelectPrevTab
 nmap <leader>l <Plug>AirlineSelectNextTab


" ============================================================================
" coc.nvim 插件配置
" ============================================================================
" 更改更新时间， 默认是 4000 ms
set updatetime=300

" 为消息留出更多的空间
set cmdheight=2


" 追踪到定义的位置
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
" 查看被谁引用
nmap <silent> gr <Plug>(coc-references)

" 预览窗口显示文档
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')

" 重命名的快捷操作
nmap <leader>rn <Plug>(coc-rename)

" 关闭提示后手动唤醒提示
inoremap <silent><expr> <c-l> coc#refresh()
" 通过回车展开代码片段
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" 可以通过 Tab 键来切换提示列表选择
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 代码提示列表选择， 将原本的 c-p 和 c-n 添加更习惯的方式
inoremap <silent><expr> <M-k> "\<C-p>"
inoremap <silent><expr> <M-j> "\<C-n>"

" 格式化代码， 需要 lsp 支持
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" 修复当前选中的代码
nmap <leader>qf  <Plug>(coc-fix-current)

" 显示错误信息
nmap <silent> <M-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <M-j> <Plug>(coc-diagnostic-next)

" coc-go 保存的时候自动导包
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
" =================================================================