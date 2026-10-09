#!/bin/bash
config_dependencies_list=("bg_feh" "i3" "kitty" "polybar" "picom")
config_names_list=("qiyana_config" "blue_win_config")

rm -rf .git

function config_setup {
    for config in "${config_names_list[@]}"; do
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
                        mkdir $HOME/.config/$item
                        cp logo.jpg $HOME/.config/$item
                    fi
                done
                cd ..
                ;;

            "i3")
                cd $item
                for config_i3_name in "${config_names_list[@]}"; do
                    if [[ "${user_config_choose}.i3wmconf" == "${config_i3_name}.i3wmconf" ]]; then
                        mv "${user_config_choose}.i3wmconf" config
                        cp config $HOME/.config/$item
                    fi
                done
                cd ..
                ;;

            "kitty")
                cd $item
                for config_kitty_name in "${config_names_list[@]}"; do
                    if [[ "${user_config_choose}.kittyconf" == "${config_kitty_name}.kittyconf" && "${user_config_choose}.kittytheme" == "${config_kitty_name}.kittytheme" ]]; then
                        mv "${user_config_choose}.kittyconf" kitty.conf
                        mv "${user_config_choose}.kittytheme" theme.conf

                        mkdir $HOME/.config/$item
                        cp kitty.conf $HOME/.config/$item
                        cp theme.conf $HOME/.config/$item
                    fi
                done
                cd ..
                ;;

            "polybar")
                cd $item
                for config_polybar_name in "${config_names_list[@]}"; do
                    if [[ "${user_config_choose}.polybarconf" == "${config_polybar_name}.polybarconf" ]]; then
                        mv "${user_config_choose}.polybarconf" config.ini
                        mkdir $HOME/.config/$item
                        cp config.ini $HOME/.config/$item
                    fi
                done
                cd ..
                ;;

            "picom")
                cd $item
                for config_picom_name in "${config_names_list[@]}"; do
                    if [[ "${user_config_choose}.picomconf" == "${config_picom_name}.picomconf" ]]; then
                        mv "${user_config_choose}.picomconf" picom.conf
                        mkdir $HOME/.config/$item
                        cp picom.conf $HOME/.config/$item
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
1 – qiya conf
2 – blue_win conf
To download a config: Install config -> select the configuration.

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




