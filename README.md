# PageBar
DWM bar with Pages!

<img src="https://github.com/Randomguy-8/PageBar/blob/main/src/9.png">

## Table Of Contents
- [Installation](#installation)
- [Dependency](#dependency)
- [Conept](#concept)
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

## Concept
There are alot of bar's and bar-scripts available for DWM. PageBar is Just one of them, but with little twist.

PageBar shows all basic stauts like *clock*, *brightness*, *Volume*, and *battery*. But it has **pages**(extra status information) which pop up in place of default status whenever it's called.

Pagebar is inspired by [dwm-bar](https://github.com/joestandring/dwm-bar) and [chadwm](https://github.com/siduck/chadwm)'s bar.


## Dependency
1) [cpu-stat](https://github.com/vivaladav/cpu-stat)  -  A command line program to get CPU usage statistics on Linux systems.<br>
2) xbacklight  - To controle Brightness.<br>
3) alsamixer - To controle Volume.<br>
4) [wpa_supplicant](https://w1.fi/wpa_supplicant/) - To manage Network.
5) [Nerd-Fonts](https://github.com/ryanoasis/nerd-fonts) - Icons used in bar.

## Configuration
Most of Configurations can be done via editing the source code.<br>
Yet there are some variables(predefined) that you can easily edit(also in source code).



