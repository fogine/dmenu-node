# dmenu-node-scripts

This direcory contains scripts usually utilizing the `dmenu-node` wrapper with another command line app.

## Installation 

For scripts to work, it will be needed to move them somewhere to your `path` and then execute them in your
`dmenu-node` custom command definition.

The following is example of the `dmenu-node-task` script configuration in JSON config file `$HOME/.config/dmenu-node/config`:

**NOTE:** if you want to use below config example, you must remove all comments. Config must be defined as strict JSON

````js
{
    "commands": {
        "todo": {
            "type": "terminal",
            "cmd": "dmenu-node-task '%b'",
            // It's possible to define a script in place of `cache` option.
            //The script is expected to process command arguments from dmenu (%b) and return a string value which will be cached & sorted => will apear as a suggestion in dmenu list
            // The below cache definition will process input eg:
            // td common/ go to grocery store
            // and will produce ouput string "td common/" which will be cached
            "cache": "echo $(echo ' %b ' | awk 'BEGIN{RS=\" \"} /\\/$/{print \"td \" $1}')"
        }
    }
}
````
