if status is-interactive
    # command cat ~/.cache/ags/user/generated/terminal/sequences.txt
    rxfetch
end

# fish_add_path /home/juuls/.spicetify

set -gx EDITOR nvim
set -gx BROWSER qutebrowser
set -Ux QBPM_PROFILE_DIR /home/juuls/.config/qutebrowser/profiles/


# starship init fish | source
# enable_transience
