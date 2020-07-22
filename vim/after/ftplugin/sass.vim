setlocal define=^\\s*\\%(@mixin\\\|=\\)
setlocal includeexpr=substitute(v:fname,'\\%(.*/\\\|^\\)\\zs','_','')
setlocal suffixesadd=.sass,.scss,.css
let &l:include = '^\s*@import\s\+\%(url(\)\=["'']\='
