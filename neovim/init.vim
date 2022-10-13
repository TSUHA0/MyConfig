"=============================================================================
" init.vim --- Entry file for neovim
" Copyright (c) 2016-2021 Wang Shidong & Contributors
" Author: Wang Shidong < wsdjeg@outlook.com >
" URL: https://spacevim.org
" License: GPLv3
"=============================================================================

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/main.vim'
set termguicolors

let g:VIM_HOME = expand('~/.config/nvim')
let s:vim_plug_path = g:VIM_HOME.'/autoload/plug.vim'
if !filereadable(s:vim_plug_path)
	echo "Installing Vim-plug ..."
	echo ""
	let s:vim_plug_git = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	execute "!curl -fLo ".s:vim_plug_path." --create-dirs ".s:vim_plug_git
endif
let s:vim_plugged_path = g:VIM_HOME.'/plugged'

filetype on
autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2 comments-=:#
autocmd FileType lua setlocal shiftwidth=2 softtabstop=2

call plug#begin('~/.config/nvim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tpope/vim-fugitive',
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'ojroques/vim-oscyank', {'branch': 'main'}
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  "Plug 'windwp/nvim-autopairs'
  Plug 'voldikss/vim-floaterm'
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-repeat'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'ahmedkhalf/project.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
  Plug 'fannheyward/telescope-coc.nvim'
  Plug 'nvim-telescope/telescope-project.nvim'
  Plug 'nvim-telescope/telescope-frecency.nvim'
  Plug 'nvim-telescope/telescope-ui-select.nvim'
  Plug 'cljoly/telescope-repo.nvim'
  Plug 'kevinhwang91/nvim-bqf'
  Plug 'dstein64/vim-startuptime'
  Plug 'sindrets/diffview.nvim'
  Plug 'CRAG666/code_runner.nvim'
  Plug 'windwp/nvim-spectre'

call plug#end()

lua require('init')

vmap <C-j> <Plug>(coc-snippets-select)
inoremap <silent> <A-p> <C-r>=CocActionAsync('showSignatureHelp')<CR>

let g:coc_global_extensions = ['coc-tsserver', 'coc-html', 'coc-css', 'coc-json',
            \ 'coc-java', 'coc-pyright', 'coc-flutter', 'coc-jedi', 'coc-snippets',
            \ 'coc-emmet', 'coc-snippets', 'coc-xml', 'coc-yaml',
            \ 'coc-markdownlint','coc-highlight', 'coc-explorer',
            \ 'coc-cmake', 'coc-explorer', 'coc-go', 'coc-vimlsp', 
            \ 'coc-sql', 'coc-toml', 'coc-tsserver', 'coc-lightbulb']

let g:EasyMotion_smartcase = 1
map  <A-f> <Plug>(easymotion-bd-w)
nmap <A-f> <Plug>(easymotion-overwin-w)
map  , <Plug>(easymotion-bd-w)
nmap , <Plug>(easymotion-overwin-w)
nunmap ,<space>
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
" Unexpected diagnostics when using easymotion.
autocmd User EasyMotionPromptBegin :let b:coc_diagnostic_disable = 1
autocmd User EasyMotionPromptEnd :let b:coc_diagnostic_disable = 0


nmap <A-`> <Cmd>CocCommand explorer --no-quit-on-open --no-toggle --position=right<CR>
nmap <C-A-l> <Cmd>CocCommand editor.action.formatDocument<CR>
nmap <F3> <Cmd>CocCommand explorer --position=right<CR>
nmap ; :
call SpaceVim#custom#SPC('nnoremap', ['f', 't'], 'CocCommand explorer --position=right', 'Explorer', 1)
call SpaceVim#custom#SPC('nnoremap', ['p', 'i'], 'PlugInstall', 'PlugInstall', 1)

noremap <silent> <C-S-Left> :vertical resize -5<CR>
noremap <silent> <C-S-Right> :vertical resize +5<CR>
noremap <silent> <C-S-Up> :resize -5<CR>
noremap <silent> <C-S-Down> :resize -5<CR>
vnoremap <leader>y :OSCYank<CR>
vnoremap <space>y :OSCYank<CR>
"refresh buffer
nmap <A-r> :e<CR>
nmap <leader>cc :e ~/.SpaceVim/init.vim<CR>
nmap <leader>cd :e ~/.SpaceVim.d/init.toml<CR>
nmap <leader>cf :e ~/.SpaceVim/lua/init.lua<CR>
nmap <leader>rr :RunFile float<CR>

nnoremap <leader>S <cmd>lua require('spectre').open()<CR>

"search current word
nnoremap <leader>sw <cmd>lua require('spectre').open_visual({select_word=true})<CR>
vnoremap <leader>s <esc>:lua require('spectre').open_visual()<CR>
"  search in current file
nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>
" run command :Spectre

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nmap <space><space> <cmd>Telescope<cr>
let g:_spacevim_mappings_space.o = get(g:_spacevim_mappings_space, 'o',  {
        \ 'name' : '+TelescopeCoc',
        \ })
call SpaceVim#custom#SPC('nnoremap', ['o', 'o'], 'Telescope coc', 'Coc', 1)
call SpaceVim#custom#SPC('nnoremap', ['o', 'd'], 'Telescope coc workspace_diagnostics', 'CocWorkspaceDiag', 1)
call SpaceVim#custom#SPC('nnoremap', ['o', 'a'], 'Telescope coc code_actions', 'CocCodeAction', 1)
call SpaceVim#custom#SPC('nnoremap', ['o', 'r'], 'Telescope coc references', 'CocReferences', 1)
call SpaceVim#custom#SPC('nnoremap', ['G'], 'Telescope repo list', 'Repolist', 1)
call SpaceVim#custom#SPC('nnoremap', ['P'], 'Telescope project', 'Project', 1)
" setup mapping to call :LazyGit
nnoremap <silent> <leader>gg :LazyGit<CR>
call SpaceVim#custom#SPC('nnoremap', ['g', 'g'], 'FloatermNew lazygit', 'LazyGit', 1)

" Terminal to normal mode
tnoremap <silent> <C-[><C-[> <C-\><C-n>
" Floaterm configuration 
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
let g:floaterm_keymap_toggle = '<F7>'
let g:floaterm_keymap_next   = '<F8>'
let g:floaterm_keymap_new    = '<F12>'

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.


inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
let g:_spacevim_mappings_space.C = get(g:_spacevim_mappings_space, 'C',  {
        \ 'name' : '+Coc',
        \ })
" Show all diagnostics.
nnoremap <silent><nowait> <space>Ca  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>Ce  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>Cc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>Co  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>Cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>Cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>Ck  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>Cp  :<C-u>CocListResume<CR>
" Switch to source file or header file for cpp/c
nnoremap <silent><nowait> <space>Ch  :<C-u>CocCommand clangd.switchSourceHeader<CR>
