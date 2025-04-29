#!/bin/bash

# tmux komutundaki -s SESSION_NAME kısmını al
session_name=""
for ((i=1; i<=$#; i++)); do
    if [[ ${!i} == "-s" ]]; then
        j=$((i + 1))
        session_name=${!j}
        break
    fi
done

# Eğer session name bulunduysa, başlığı ayarla
if [[ -n "$session_name" ]]; then
    printf "\033]2;%s\033\\" "$session_name"
fi

# Orijinal tmux komutunu çalıştır
tmux "$@"
