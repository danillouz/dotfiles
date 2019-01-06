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

  set -l normal_color (set_color normal)
  set -l success_color (set_color white --bold)
  set -l error_color (set_color $fish_color_error)
  set -l directory_color (set_color magenta)
  set -l repository_color (set_color blue)

  set -l fish "⋊>"
  set -l separator (set_color cyan)"➜ "

  set -l ahead "$normal_color ⇡"
  set -l behind "$normal_color ⇣"
  set -l diverged (set_color red)" ←→"
  set -l staged (set_color green)" ✔"
  set -l dirty (set_color red)" ✘"
  set -l stashed (set_color yellow)" ⌗"

  set -l has_untracked (git_untracked 2>/dev/null)

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
    echo -n -s " git " $repository_color (git_branch_name) $normal_color

    if git_is_stashed
      echo -n -s $stashed
    end

    if git_is_staged
      echo -n -s $staged
    end

    if git_is_dirty ;or [ "$has_untracked" ]
      echo -n -s $dirty
    else
      echo -n -s (git_ahead $ahead $behind $diverged)
    end
  else
    echo -n -s " " $directory_color $cwd $normal_color
  end

  echo -n -s " " $separator " "
end
