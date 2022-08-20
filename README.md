# PageBar
DWM bar with Pages!


## Table Of Contents
- [Installation](#installation)
- [Dependency](#dependency)
- [Configuration](#configuration)
  - [Installation](#installation)
  - [Configuration](#configuration)

## Installation
Git-Clone repository.

`git clone https://github.com/Randomguy-8/PageBar`

cd into cloned directory.

`cd PageBar/pagebar`

Make scripts executeable.

`chmod 777 pagebar*`

Copy **pagebar-(noblocks or blocks)**, **pagebarsig**, **bin/cpu-stat** to */usr/bin*.

`sudo cp bin/cpu-stat pagebar-noblocks pagebarsig /usr/bin/`

## Dependency
1) [cpu-stat](https://github.com/vivaladav/cpu-stat)  -  A command line program to get CPU usage statistics on Linux systems.<br>
2) xbacklight  - To controle Brightness.<br>
3) alsamixer - To controle Volume.<br>
4) [wpa_supplicant](https://w1.fi/wpa_supplicant/) - To manage Network.
5) [Nerd-Fonts](https://github.com/ryanoasis/nerd-fonts) - Icons used in bar.

## Configuration
Most of Configurations can be done via editing the source code.<br>
Yet there are some variables(predefined) that you can easily edit(also in source code).



