function _update_cppinit_completions
    set -l projects_path ~/.scripts/cppinit/cppTemplate/
    # This presumes your templates are named in a way that reflects their usage or type
    for file in (ls $projects_path)
        if test -d $projects_path$file
            echo $file
        end
    end
end

complete -c cppinit -n '__fish_seen_subcommand_from cppinit' -x -a '(_update_cppinit_completions)' -d 'Project templates'

complete -c cppinit -s p -l project -d 'Set the project name' -x -r
complete -c cppinit -s b -l binary -d 'Set the binary name' -x -r
