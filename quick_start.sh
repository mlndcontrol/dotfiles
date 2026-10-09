#!/bin/bash
config_dependencies_list=("bg_feh" "i3" "kitty" "polybar" "picom")
config_names_list=("qiyana_config" "blue_win_config")

rm -rf .git

function config_setup {
    for config in "${config_list[@]}"; do
        echo "Сonfiguration name: $config is available"
    done

    read -p "choose a config: " user_config_choose

    for item in "${config_dependencies_list[@]}"; do 
        case "$item" in 
            "bg_feh")
                cd $item
                for config_jpg_name in "${config_names_list[@]}"; do
                    if [[ "${user_config_choose}.jpg" == "${config_jpg_name}.jpg" ]]; then
                        mv "${user_config_choose}.jpg" logo.jpg
                    fi
                done
                cd ..
                ;;

            "i3")
                cd $item
                for config_i3_name in "${config_names_list[@]}"; do
                    if [[ "${user_config_choose}.i3wmconf" == "${config_i3_name}.i3wmconf" ]]; then
                        mv "${user_config_choose}.i3wmconf" config
                    fi
                done
                cd ..
                ;;

        esac
    done 

}


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

            config_setup
            ;;

        3)
            break
            ;;
    esac

done 




