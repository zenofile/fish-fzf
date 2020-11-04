function cheat -a query
    if not test -z "$query"
        curl "cheat.sh/$query"
        return 0
    end

    curl -s cheat.sh/:list \
    | eval (__fzfcmd)" $FZF_DEFAULT_OPTS" \
    | read -l query

    if test -z "$query"
        return 0
    end

    curl "cheat.sh/$query"
end

complete -c cheat -xa '(curl -s cheat.sh/:list)'
