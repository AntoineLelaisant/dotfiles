let g:ale_javascript_eslint_use_global = 0
let g:ale_javascript_stylelint_use_global = 0
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_php_php_cs_fixer_executable = './vendor/bin/php-cs-fixer'

let g:ale_linter_aliases = {'jsx': ['css', 'javascript'],'svelte': ['css', 'javascript'] }

let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'svelte': ['stylelint', 'eslint'],
\ 'jsx': ['stylelint', 'eslint'],
\ 'vue': ['stylelint', 'eslint'],
\ 'rust': ['cargo', 'rustfmt'],
\ 'php': ['php-cs-fixer']
\}

let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'svelte': ['stylelint', 'eslint'],
\ 'jsx': ['stylelint', 'eslint'],
\ 'vue': ['stylelint', 'eslint'],
\ 'rust': ['rustfmt'],
\ 'php': ['php-cs-fixer']
\}
