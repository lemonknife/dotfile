function prepend_sudo
    set -l cmd (commandline)
    if test -z "$cmd"
        commandline -r $history[1]
    end

    set -l old_cursor (commandline -C)
    commandline -C 0
    commandline -i "sudo "
    commandline -C (math $old_cursor + 5)
end