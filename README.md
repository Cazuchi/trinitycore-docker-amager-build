Setup steps:  

Point the `extractor service volume` on line 21 in `compose.yml` to the root directory of the game installation, in my case: `C:\Users\...\Desktop\WoW_WotLK:/wow-client:ro`  

Run `docker compose --profile tools run extractor` in PowerShell  

Run `docker compose up -d` in PowerShell  

Run `docker compose ps` to check that all three instances are running.  

Run `docker attach tc-worldserver` in PowerShell, followed by `account create <username> <password>` and `account set gmlevel <username> 3 -1`  

Ctrl-C to get back out. This will kill the worldserver tho, so spin it back up with `docker compose up -d worldserver` or figure out how to detach properly xD  

Edit `realmlist.wtf` in `Data/enUS/realmlist.wtf` to point to the server `set realmlist 127.0.0.1` (Use # to comment out any existing realmlist. Only one can apply at a time.)  