if status is-interactive
    fish_vi_key_bindings
    set -g fish_vi_mode_prompt ""
    bind -M insert -m default jk cancel cursor-back repaint-mode 
    # Alias
    abbr -a cclip xclip -selection clipboard
    abbr -a scu systemctl --user
    abbr -a sc systemctl
    abbr -a ggc git clone
    abbr -a ggf git fetch
    abbr -a gga git add -A 
    abbr -a ggcm git commit -m 
    abbr -a ggp git push
    abbr -a latr la -tr
end

