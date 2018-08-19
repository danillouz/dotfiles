# Customized version of OMF default theme:
# https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md#default

function fish_prompt
  set -l last_command_status $status
  set -l cwd

  if test "$theme_short_path" = 'yes'
    set cwd (basename (prompt_pwd))
  else
    set cwd (prompt_pwd)
  end

  set -l fish "⋊>"
  set -l ahead (set_color green)"↑ "
  set -l behind (set_color red)"↓ "
  set -l diverged (set_color red)"☂︎ "
  set -l dirty (set_color red)"✱ "
  set -l stashed (set_color yellow)"❒ "
  set -l none (set_color green)"✔︎ "
  set -l separator (set_color yellow)"❯"(set_color red)"❯"(set_color green)"❯"

  set -l normal_color (set_color normal)
  set -l success_color (set_color $fish_pager_color_progress ^/dev/null; or set_color green)
  set -l error_color (set_color $fish_color_error ^/dev/null; or set_color red --bold)
  set -l directory_color (set_color magenta)
  set -l repository_color (set_color white)

  if test $last_command_status -eq 0
    echo -n -s $success_color $fish $normal_color
  else
    echo -n -s $error_color $fish $normal_color
  end

  if git_is_repo
    if test "$theme_short_path" = 'yes'
      set root_folder (command git rev-parse --show-toplevel ^/dev/null)
      set parent_root_folder (dirname $root_folder)
      set cwd (echo $PWD | sed -e "s|$parent_root_folder/||")
    end

    echo -n -s " " $directory_color $cwd $normal_color
    echo -n -s " git " $repository_color (git_branch_name) $normal_color " "

    if git_is_stashed
      echo -n -s $stashed
    end
    
    if git_is_touched
      echo -n -s $dirty
    else
      echo -n -s (git_ahead $ahead $behind $diverged $none)
    end
  else
    echo -n -s " " $directory_color $cwd $normal_color
  end

  echo -n -s $separator " "
end
