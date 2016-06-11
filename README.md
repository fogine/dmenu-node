# dmenu-node

This wrapper adds `dmenu` post-selection `hooks` functionality with possibility of defining custom commands which are given parsed `dmenu` stdout.  
In addition, `dmenu` item list is sorted by `frequency` & `recency` by utilizing simple caching layer.  
Few caching options make it possible to control what should be cached and what not.  

## Dependencies

* [nodejs](https://nodejs.org/en/download/)
* [dmenu](https://aur.archlinux.org/packages/dmenu2/)

## Installation 

````bash
git clone https://github.com/fogine/dmenu-node.git
cd ./dmenu-node/
export PREFIX=~/.local && make install
````

then just bind `dmenu-node` executable to global shortcut.

## Usage

Custom options and command hooks defnitions are defined in JSON config file `$HOME/.config/dmenu-node/config`.  

**NOTE:** if you want to use below config example, you must remove all comments. Config must be defined as strict JSON

Example config file:

````js
{
    "dmenu": ["dmenu", "-q", "-b", "-t"], //defines dmenu executable and its options
    "paths": [ //defines list of paths whose files will be sorted appended to dmenu item list
        "/home/username/.local/bin",
        "/usr/local/bin",
        "/usr/bin"
    ],
    "defaultWebCmd": "exec google-chrome '%b'", //default `cmd` for all `commands` of type `web`
    "commands": {
        //defines `js` command which will not be cached or appended to dmenu item list. If you type "js hasOwnProperty" and terminate dmenu with "ENTER", you will be presented with 'Object.hasOwnProperty' documentation page in `google-chrome` browser
        "js": {
            "type": "web",
            "url": "https://google.com/search?q=%s%20site%3Ahttps%3A%2F%2Fdeveloper.mozilla.org&btnI"
        },
        "g": {
            "type": "web",
            "url": "https://google.com/search?q=%s"
        },
        //command "=" expects "bc" and "notify-send" executables in your "path". If you type: "= 1+2", result "3" will be shown as popup notification
        "=": {
            "type": "terminal",
            "cmd": "notify-send $(echo \"%b\" | bc -l) -t 3000",
            "cache": "single"
        }
    }
}
````
