bind \cx zz

set -l name (basename (status -f) .fish)_uninstall

function $name --on-event $name
    bind --erase \cx
end
