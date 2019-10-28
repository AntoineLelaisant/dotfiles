let g:ale_javascript_eslint_use_global = 0
let g:ale_javascript_stylelint_use_global = 0
let g:ale_javascript_eslint_executable = 'eslint_d'

let g:ale_linter_aliases = {'jsx': ['css', 'javascript'],'svelte': ['css', 'javascript'] }

let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'svelte': ['stylelint', 'eslint'],
\ 'jsx': ['stylelint', 'eslint'],
\ 'vue': ['stylelint', 'eslint'],
\ 'rust': ['cargo', 'rustfmt']
\}

let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'svelte': ['stylelint', 'eslint'],
\ 'jsx': ['stylelint', 'eslint'],
\ 'vue': ['stylelint', 'eslint'],
\ 'rust': ['rustfmt']
\}
