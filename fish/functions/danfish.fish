# Customized version of: https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md#default
function danfish
  set -l last_command_status $status

  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l green (set_color -o green)
  set -l blue (set_color -o blue)
  set -l magenta (set_color -o magenta)
  set -l black (set_color -o black)
  set -l normal_color (set_color normal)

  set -l cwd (prompt_pwd)

  set -l fish "⋊>"
  set -l dirty "*"
  set -l staged "+"
  set -l stashed "≡"
  set -l ahead "⇡"
  set -l behind "⇣"

  if not set -q -g __fish_danfish_functions_defined
    set -g __fish_danfish_functions_defined

    # https://github.com/oh-my-fish/oh-my-fish/blob/master/lib/git/git_is_repo.fish
    function git_is_repo -d "Check if directory is a repository"
      test -d .git
      or begin
        set -l info (command git rev-parse --git-dir --is-bare-repository 2>/dev/null)
        and test $info[2] = false
      end
    end

    # https://github.com/oh-my-fish/oh-my-fish/blob/master/lib/git/git_branch_name.fish
    function git_branch_name -d "Get current branch name"
      git_is_repo; and begin
        command git symbolic-ref --short HEAD 2> /dev/null;
          or command git show-ref --head -s --abbrev | head -n1 2> /dev/null
      end
    end

    # https://github.com/oh-my-fish/oh-my-fish/blob/master/lib/git/git_is_worktree.fish
    function git_is_worktree -d "Check if directory is inside the worktree of a repository"
      git_is_repo
      and test (command git rev-parse --is-inside-git-dir) = false
    end

    # https://github.com/oh-my-fish/oh-my-fish/blob/master/lib/git/git_is_touched.fish
    function git_is_touched -d "Check if repo has any changes"
      git_is_worktree; and begin
        # The first checks for staged changes, the second for unstaged ones.
        # We put them in this order because checking staged changes is *fast*.
        not command git diff-index --cached --quiet HEAD -- >/dev/null 2>&1
        or not command git diff --no-ext-diff --quiet --exit-code >/dev/null 2>&1
      end
    end

    # https://github.com/oh-my-fish/oh-my-fish/blob/master/lib/git/git_is_stashed.fish
    function git_is_stashed -d "Check if repo has stashed contents"
      git_is_repo; and begin
        command git rev-parse --verify --quiet refs/stash >/dev/null
      end
    end

    # https://github.com/oh-my-fish/oh-my-fish/blob/master/lib/git/git_is_staged.fish
    function git_is_staged -d "Check if repo has staged changes"
      git_is_repo; and begin
        not command git diff --cached --no-ext-diff --quiet --exit-code
      end
    end

    # https://github.com/oh-my-fish/oh-my-fish/blob/master/lib/git/git_ahead.fish
    function git_ahead -a ahead behind
      not git_is_repo; and return

      set -l commit_count (command git rev-list --count --left-right "@{upstream}...HEAD" 2> /dev/null)

      switch "$commit_count"
      case ""
        # no upstream
      case "0"\t"0"
        echo ""
      case "*"\t"0"
        test -n "$behind"; and echo "$behind"
      case "0"\t"*"
        test -n "$ahead"; and echo "$ahead"
      end
    end
  end

  if git_is_repo
    echo -n -s $cyan $cwd $normal_color " "
    echo -n -s $black (git_branch_name) $normal_color

    if git_is_touched
      echo -n -s $black $dirty $normal_color
    end

    if git_is_stashed
      echo -n -s " " $yellow $stashed $normal_color
    end

    if git_is_staged
      echo -n -s " " $green $staged $normal_color
    end

    echo -n -s $magenta (git_ahead $ahead $behind) $normal_color
  else
    echo -n -s $cyan $cwd $normal_color
  end

  if test $last_command_status -eq 0
    echo -n -s " " $blue $fish $normal_color
  else
    echo -n -s " " $red $fish $normal_color
  end

  if test "$USER" = 'root'
    set fish "#"
  end

  echo -n -s " "
end
