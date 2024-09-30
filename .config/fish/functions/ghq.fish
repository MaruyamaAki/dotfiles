function ghq
    if [ $argv[1] = repo ]
        set --erase argv[1]
        source ~/.config/fish/functions/ghq.sh $argv 2>/dev/null
    else
        command ghq $argv
    end
end
