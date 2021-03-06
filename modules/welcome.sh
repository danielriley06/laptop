#!/bin/bash

RenderWelcome() {
  distro="macOS $(sw_vers -productVersion)"
  kernel=$(uname)
  shell="$SHELL"
  terminal="$TERM ${TERM_PROGRAM//_/ }"
  cpu=$(sysctl -n machdep.cpu.brand_string)
  battery=$(ioreg -c AppleSmartBattery -r | awk '$1~/Capacity/{c[$1]=$3} END{OFMT="%.2f%"; max=c["\"MaxCapacity\""]; if (max>0) { print 100*c["\"CurrentCapacity\""]/max;} }')

  # removes (R) and (TM) from the CPU name so it fits in a standard 80 window
  cpu=$(echo "$cpu" | awk '$1=$1' | sed 's/([A-Z]\{1,2\})//g')

  ram="$(( $(sysctl -n hw.memsize) / 1024 ** 3  )) GB"
  disk=$(df | head -2 | tail -1 | awk '{print $5}')

  RED=$(tput       setaf 1 2>/dev/null)
  GREEN=$(tput     setaf 2 2>/dev/null)
  YELLOW=$(tput    setaf 3 2>/dev/null)
  BLUE=$(tput      setaf 4 2>/dev/null)
  PURPLE=$(tput    setaf 5 2>/dev/null)
  textColor=$(tput setaf 6 2>/dev/null)
  normal=$(tput    sgr0 2>/dev/null)

  fieldlist[${#fieldlist[@]}]="${textColor}User:${normal} ${user}${normal}"
  fieldlist[${#fieldlist[@]}]="${textColor}Hostname:${normal} ${hostname}${normal}"
  fieldlist[${#fieldlist[@]}]="${textColor}Distro:${normal} ${distro}${normal}"
  fieldlist[${#fieldlist[@]}]="${textColor}Kernel:${normal} ${kernel}${normal}"
  fieldlist[${#fieldlist[@]}]="${textColor}Uptime:${normal} ${uptime}${normal}"
  fieldlist[${#fieldlist[@]}]="${textColor}Shell:${normal} ${shell}${normal}"
  fieldlist[${#fieldlist[@]}]="${textColor}Terminal:${normal} ${terminal}${normal}"
  fieldlist[${#fieldlist[@]}]="${textColor}CPU:${normal} ${cpu}${normal}"
  fieldlist[${#fieldlist[@]}]="${textColor}Memory:${normal} ${ram}${normal}"
  fieldlist[${#fieldlist[@]}]="${textColor}Disk:${normal} ${disk}${normal}"
  if [[ ! -z $battery ]]; then
      fieldlist[${#fieldlist[@]}]="${textColor}Battery:${normal} ${battery}%${normal}"
  fi

  echo -e "
  ${GREEN#  }                    ###               ${fieldlist[0]}
  ${GREEN#  }                  ####                ${fieldlist[1]}
  ${GREEN#  }                  ###                 ${fieldlist[2]}
  ${GREEN#  }          #######    #######          ${fieldlist[3]}
  ${YELLOW# }        ######################        ${fieldlist[4]}
  ${YELLOW# }       #####################          ${fieldlist[5]}
  ${RED#    }       ####################           ${fieldlist[6]}
  ${RED#    }       ####################           ${fieldlist[7]}
  ${RED#    }       #####################          ${fieldlist[8]}
  ${PURPLE# }        ######################        ${fieldlist[9]}
  ${PURPLE# }         ####################         ${fieldlist[10]}
  ${BLUE#   }           ################           ${fieldlist[11]}
  ${BLUE#   }            ####     #####            ${fieldlist[12]}
  \n\n
  ${normal}macOS Development Environment Installer
  "
}