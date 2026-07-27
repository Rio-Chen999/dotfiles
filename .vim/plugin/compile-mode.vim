" ====================================================================
" 1. Global variable: Stores the last used command
" ====================================================================
let g:last_compile_cmd = ""

" ====================================================================
" 2. Core compilation functions
" ====================================================================
function! UserCompile()
    " A. Obtain user input
    " If there was a previous command, 
    " it will be displayed as the default value for easy repeated execution
    if g:last_compile_cmd != ""
        let l:cmd = input("Compile command: ", g:last_compile_cmd)
    else
        " Provide intelligent default construction based on the current file type
        let l:cmd = input("Compile command: ", GetSmartDefaultCmd())
    endif

    " If the user cancels the input (an empty string), exit
    if l:cmd == ""
        return
    endif

    " Update global records
    let g:last_compile_cmd = l:cmd

    " B. Execute the command and capture the output
    " system() will execute shell commands and 
    " return the combined content of standard output and standard error
    echo "\nRunning: " . l:cmd
    let l:output = system(l:cmd)
    
    " Get the exit status code (0 indicates success)
    let l:exit_code = v:shell_error

    " C. Write the output to the Quickfix list
    " cexpr will automatically parse the error information in the string according to the current errorformat
    cexpr l:output

    " D. Feedback Results
    if l:exit_code == 0
        echohl ModeMsg
        echo "Compilation successful."
        echohl None
        " Optional: If successful, the quickfix window can be automatically closed
        cclose
    else
        echohl ErrorMsg
        echo "Compilation failed with code: " . l:exit_code
        echohl None
        " If there are errors, the quickfix window will automatically open for viewing
        cwindow
    endif
endfunction

" ==========================================
" 3. Auxiliary function: Smart default command
" ==========================================
function! GetSmartDefaultCmd()
    let l:file = expand('%')
    let l:ext = expand('%:e')
    let l:name_no_ext = expand('%:t:r')

    if l:ext == 'c'
        return 'gcc -Wall -o ' . l:name_no_ext . ' ' . l:file
    elseif l:ext == 'cpp' || l:ext == 'cc'
        return 'g++ -Wall -o ' . l:name_no_ext . ' ' . l:file
    elseif l:ext == 'go'
        return 'go build .'
    elseif l:ext == 'rs'
        return 'cargo build'
    elseif l:ext == 'py'
        return 'python3 ' . l:file
    else
        return 'make'
    endif
endfunction

" ==========================================
" 4. Incorrect format configuration (must be set, otherwise cannot jump)
" ==========================================
" Even without using `makeprg`, Vim still needs to know how to parse the errors output by the compiler
" Here, a universal format for GCC/Clang/GCC-like is configured
set errorformat=%E%f:%l:%c:\ %m,%W%f:%l:%c:\ %m,%C%.%#

" ==========================================
" 5. Shortcut key mapping
" ==========================================
" Press <Leader>c to trigger compilation
nnoremap <leader>c :call UserCompile()<CR>

" Error navigation shortcut key
nnoremap <leader>n :cnext<CR>zz
nnoremap <leader>p :cprev<CR>zz
nnoremap <leader>q :cwindow<CR>

