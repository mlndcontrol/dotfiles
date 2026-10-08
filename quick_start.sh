#!/bin/bash
config_list=("bg_feh" "i3" "kitty" "polybar" "picom")

rm -rf .git

while true
do
    clear
    echo " 1 - About configs"
    echo " 2 - Install config"
    echo " 3 - Exit"
    read -p ": " user_input


    case $user_input in 
        1)
            cat << 'EOF'

The dotfiles repo contains two configurations:
1 – green config
2 – blue config
To download a config: Install config -> elect the configuration number.

EOF

            read -p "Press any button..."
            ;;
        2)
            echo " 1 - green conf / 2 - blue conf"
            read -p "choose a config: " user_config_choose

            case $user_config_choose in 
                1)
                    for item in "${config_list[@]}"; do
                        mv $item $HOME/.config/
                        echo "item: $item moved to .config dir"
                    done

                    read -p "You can exit the installer & reboot pc"
                    ;;
            esac
            ;;

        3)
            break
            ;;
    esac

done 




