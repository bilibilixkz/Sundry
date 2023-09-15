A Minecraft server sanner based on [mcstatus](http://pypi.org/project/mcstatus/), also uses some code from [ping3](http://pypi.org/project/ping3/).

To use it, just open and enter the IP which you want to scan. ServersSanner will check if there is a server on ports between 1024 and 65535, and print a message on console when one was found.

This project is tested on Python 3.11.3. Earlier versions such as 3.8 or 3.9 might also work, but I haven't test them yet.
I come up the idea to make it while I was writing ServerBot for FRG Server, and which might to be uploaded to GitHub later.

Note: it can currently only scan JE servers.
