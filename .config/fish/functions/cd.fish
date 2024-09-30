functions --erase cd


function cd
    if test -z "$argv[1]"
        builtin cd ~
        return
    else if test -d "$argv[1]" || test "$argv[1]" = /
        if builtin cd "$argv[1]"
            zoxide add (pwd)
        end
    else
        zi "$argv[1]"
    end
end
