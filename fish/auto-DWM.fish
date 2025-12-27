if test -z "$DISPLAY"; and test "$XDG_VTNR" -eq 1
    mkdir -p ~/.cache
    exec startx > ~/.cache/startx.log 2>&1
end
