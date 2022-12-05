# PageBar
DWM bar with Pages!

<img src="https://github.com/Randomguy-8/PageBar/blob/main/src/pagebar.gif">

**The status is changing on command.* <br>
**Other imgs are available inside ```src/```*

## Table Of Contents
- [Installation](#installation)
- [Concept](#concept)
- [Dependency](#dependency)
- [Configuration](#configuration)
  - [Refresh Rate](#refresh-rate)
  - [Add Custom page](#pages)
  - [Call Custom page](#calling)
- [Modules Reference](#modules-reference)
- [ToDo](#todo)
- [Contributing](#contributing)
- [ThankYou](#thankyou)


## Installation
Git-Clone repository.

```
git clone https://github.com/Randomguy-8/PageBar
cd PageBar
chmod 777 pagebar.sh
./pagebar.sh
```

## Concept
There are alot of bar-scripts available for [DWM](dwm.suckless.org/). PageBar is Just one of them, but with little twist.

Let me explain it with a story:<br>
you have a well configured bar-script but you need a module inside bar which you use frequently but not on daily basis.
in such case will you reconfigure your bar-script with that particular modules and make your bar messy.
And if you choose not to see that module again will you reconfigure your script again? So why not use Pagebar instead.<br>

It lets you See all your important modules on your first page and remaing on other pages(shorted by the more frequently they are needed).

## Dependency
1) [cpu-stat](https://github.com/vivaladav/cpu-stat)  -  A command line program to get CPU usage statistics(present as binary inside *PageBar/bin/*).<br>

## Configuration
Most of Configurations can be done via editing the source code.<br>

### Refresh Rate
Refresh rate can be defined Individualy in evey Page by setting variable `UPDATE=<int-num>` anywhere outside the `page_(){...}` function.
eg:-
```
UPDATE=1  # i.e sleep for 500 milliseconds

page_(){
  ....
  }
```
> ***UPDATE=2***   means Sleep for 1 second

### Pages
Every page is configured Indvidualy, therfore you can add/define custom Functions, Actions, Colors and Icons for every page separately.<br>

**Basic Structure of a Page:**
```
## Your Custom page
UPDATE=<int>

functions_(){
        ...
        # Add needed modules here and use functions to take
        # full control over the execution of those functions.
        ...
        func_skip_        2        Clock_        # Clock will be updated after skip two loops.
}

pages_(){
        ...
        # Edit the Information recived from processing those modules
        # or add gylmps/icons in from of those informations to define them on bar.
        ...
        Status+="Time: $Clock"
}
````
### Calling

You can Call a custom page on your bar by these methods:
<details>
  <summary>By Defining in Pagebar</summary>

  <br>
Define the location of your Custom page inside Pagebar to make it easily accessible from anywhere.

eg:-
```
$ ls $HOME/PageBar/pages
page_main    page_clock    page_custom
```
pagebar.sh:-
```
...
Page_Name+=("$HOME/PageBar/pages/page_main")
Page_Name+=("$HOME/PageBar/pages/page_clock")
Page_Name+=("$HOME/PageBar/pages/page_custom")
...
```
</details>

<details>
<summary>By using command line argumments</summary>
<br>
  
```
$ ./pagebar.sh {location-of-custom-page}
```

</details>

## Modules Reference

<details>
  <summary>Reference</summary>
Todo...

</details>

## Call Pages
Add tese keybinding inside ```key[]``` function of your dwm `config.h` file.
```
static Key keys[] = {
...
  /* Custom Bar Functions */
  { MODKEY,        XK_F1,        spawn,        SHCMD("./$HOME/PageBar/pagebar -p")},        // Previous Page
  { MODKEY,        XK_F2,        spawn,        SHCMD("./$HOME/PageBar/pagebar -n")},        // next Page
  { MODKEY,        XK_F3,        spawn,        SHCMD("./$HOME/PageBar/pagebar -r")},        // Refresh
...
}
```

# ToDo
- [ ] More Modules.
- [ ] Time based execution of modules.

# Contributing
All kind of Contributions are welcomed.

# Thankyou
Thx to:

[chadwm](https://github.com/siduck/chadwm)'s bar for Inspiration.<br>
[dwmbar](https://github.com/thytom/dwmbar) by @thythom and [dwm-bar](https://github.com/joestandring/dwm-bar) by @joestandring for modules reference.
