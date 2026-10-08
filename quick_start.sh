#!/bin/bash
config_list=("bg_feh" "i3" "kitty" "polybar" "picom")

rm -rf .git

function config_setup {
    exho " 1 = green conf / 2 - blue conf"
    read -p "choose a config: " user_config_choose

    case $user_config_choose in
        1)
            for item in "${config_list[@]}"; do

                if [$item == "bg_feh"]; then
                    cd $item
                    rm blue_logo.jpg
                    mv green_logo.jpg logo.jpg 
                    cd ..

                elif [$item == "polybar"]; then
                    cd $item 
                    rm blue
                    mv green config.ini
                    cd ..

                elif [&item == "kitty"]; then
                    cd $item 
                    rm blue_kitty blue_kitty_theme
                    mv green_kitty kitty.conf
                    mv green_kitty_theme theme.conf
                    cd ..

                else 
                    cd $item && rm blue
                    mv green "${item}.conf"
                    echo "blue conf file are removed"
                    cd ..
                fi
            done

            ;;

        2) 
            for item in "${config_list[@]}"; do

                if [$item == "bg_feh"]; then
                    cd $item
                    rm green_logo.jpg
                    mv blue_logo.jpg logo.jpg
                    cd ..

                elif [$item == "polybar"]; then
                    cd &item
                    rm green
                    mv green config.ini
                    cd ..

                elif [&item == "kitty']; then
                    cd $item
                    rm green_kitty green_kitty_theme
                    mv blue_kitty kitty.conf
                    mv blue_kitty_theme theme.conf

                else
                    cd $item && rm green
                    mv blue "${item}.conf"
                    echo "green conf file are removed"
                    cd ..
                fi
            done
            ;;
    esac
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

            for item in "${config_list[@]}"; do
                mv $item $HOME/.config/
                echo "item: $item moved to .config dir"
            done

            read -p "You can exit the installer & reboot pc"

            ;;

        3)
            break
            ;;
    esac

done 




