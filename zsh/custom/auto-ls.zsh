# Auto `ls` directory contents on `cd`
# exa: https://github.com/ogham/exa
auto_ls () {
    emulate -L zsh;
    hash gls >/dev/null 2>&1 && CLICOLOR_FORCE=1 gls -aFh --color --group-directories-first || exa -al
}

chpwd_functions=(auto_ls $chpwd_functions)