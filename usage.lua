print[[

Usage: heart <command>

where <command> is one of:

    bin     heart bin
            heart bin -g
            (just prints the bin folder)

    install heart install <zip url>
            heart install <zip file>
            heart install <folder>
            heart install <pkg>
            heart install <pkg>@<version>
            
            Can specify one or more: heart install ./foo.zip ./bar.zip
            Installs dependencies in ./package.lua if no argument supplied

    link    heart link (in package dir)
            heart link <pkg> (link global into local)

    ls      heart ls
]]
