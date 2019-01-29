#!/usr/bin/env bash

display_wait_animation () {
        local process="${1}"
        local animation_delay="0.5"
        local animation_chars='⣾⣽⣻⢿⡿⣟⣯⣷'

        while ps -a | awk '{print $1}' | grep -q "${pid}";
        do
          temp="${animation_chars#?}"
          printf " [%c]  " "${animation_chars}"
          animation_chars=${temp}${animation_chars%"${temp}"}
          sleep "${animation_delay}"
          printf "\b\b\b\b\b\b"
        done
        printf "%-4s" " "
        printf "%-4s" "\b"
}

usage () {
        echo "Usage: $(basename "$0") [command]"
}

if [ $# -eq 0 ];
then
        usage
        exit 1
else
        display_wait_animation "$!"
fi