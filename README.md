# PageBar
Change Bar content Dynamically!

<img src="https://github.com/Randomguy-8/PageBar/blob/main/src/pagebar.gif">

**Bar content is changing dynamically*

>More imgs are available inside ```src/```

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
There are alot of bar-scripts available for [DWM](dwm.suckless.org/). PageBar is Just one of them, but unlike other dwm-bar scripts that are static in terns of modules they show, Pagebar can dynamically change the modules it displays with few added keybindings of DWM.

# Dependency
1) [cpu-stat](https://github.com/vivaladav/cpu-stat)  

## Configuration

> Quick Reference: Pages here refers to individual files in ```page/```directory. Eaxh file is a collection of different modules to show on screen.

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
now you can call your custom page from anywhere using ```pagebar.sh```.
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
Todo...(Module are yet to be completed.)

</details>

## Call Pages
Add tese keybinding inside ```key[]``` function of your dwm `config.h` file.
```
static Key keys[] = {
...
  /* Custom Bar Functions */
  { MODKEY,        XK_F1,        spawn,        SHCMD("./$HOME/PageBar/pagebar.sh -p")},        // Previous Page
  { MODKEY,        XK_F2,        spawn,        SHCMD("./$HOME/PageBar/pagebar.sh -n")},        // next Page
  { MODKEY,        XK_F3,        spawn,        SHCMD("./$HOME/PageBar/pagebar.sh -r")},        // Refresh
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
