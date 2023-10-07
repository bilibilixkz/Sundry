A Minecraft server sanner based on [mcstatus](http://pypi.org/project/mcstatus/), and also uses some code from [ping3](http://pypi.org/project/ping3/).

To use it, just open it and enter the IP that you want to scan to the console. ServersSanner will check if there is a server on ports between 1024 and 65535, and log a message on console when one was found.

I made this project with Python 3.11.3. Earlier versions such as 3.8 or 3.9 might also work, but I haven't test them yet.
The idea to make it began while I was writing ServerBot for FRG Server, which is already uploaded to GitHub at [here](http://github.com/bilibilixkz/ServerBot).

Note: it can currently only scan JE servers.
