#### Requirements

* git

* kitty

* feh

* polybar

* picom

* xorg-xrandr(optional)

#### Installation 

clone the repo

```shell 
git clone https://github.com/mlndcontrol/dotfiles
``` 
cd & start bash script

```shell
cd dotfiles && ./quick_start.sh
```

#### Useless for you but...

if you want to add your own configuration:

files

```shell 
bg_feh: config_name.jpg
i3: config_name.i3wmconf
kitty: config_name.kittyconf & config_name.kittytheme
polybar: config_name.polybarconf
picom: config_name.picomconf
```
in quick_start.sh add the name of your config to the end of the list

```shell
config_names_list={"conf1" "conf2" "your_conf_name"}
```

