let b:ale_linter_aliases =  ['vue', 'css', 'html', 'javascript']
let b:ale_fixers = ['prettier', 'eslint', 'stylelint']
let b:ale_linters = ['eslint', 'stylelint']

set path=.,src
set suffixesadd=.js,.jsx,.vue

function! LoadMainNodeModule(fname)
    let nodeModules = "./node_modules/"
    let packageJsonPath = nodeModules . a:fname . "/package.json"

    if filereadable(packageJsonPath)
        return nodeModules . a:fname . "/" . json_decode(join(readfile(packageJsonPath))).main
    else
        return nodeModules . a:fname
    endif
endfunction

set includeexpr=LoadMainNodeModule(v:fname)

