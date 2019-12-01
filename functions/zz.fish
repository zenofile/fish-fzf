function zz -d "List Z jump options in fzf" -a dir
    z -l \
    | tr -s ' ' \
    | eval (__fzfcmd)" $FZF_DEFAULT_OPTS --with-nth=2.. --reverse --query \"$dir\" \
        --preview \"$FZF_PREVIEW_DIR_CMD {2..}\"" \
    | read _ -l dst

    if not test -z "$dst"
        cd "$dst"

        commandline -t ""
    end

    commandline -f repaint
end
