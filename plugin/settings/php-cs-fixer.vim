" vim-php-cs-fixer
let g:php_cs_fixer_path = "/usr/local/bin/php-cs-fixer"  " define the path to the php-cs-fixer.phar
let g:php_cs_fixer_level = "psr2"               " which level ?
let g:php_cs_fixer_config = "default"           " configuration
let g:php_cs_fixer_php_path = "php"             " Path to PHP
let g:php_cs_fixer_fixers_list = ""             " List of fixers
let g:php_cs_fixer_default_mapping = 0          " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                  " Call command with dry-run option
map <leader>pcf :call PhpCsFixerFixFile()<CR>
