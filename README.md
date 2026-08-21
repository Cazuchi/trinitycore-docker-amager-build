Setup steps:

Point the `extractor service volume` on line 21 in `compose.yml` to the root directory of the game installation, in my case: `C:\Users\...\Desktop\WoW_WotLK:/wow-client:ro`

Run `docker compose --profile tools run --rm extractor` in PowerShell

Run `docker compose up -d` in PowerShell

Run `docker compose ps` to check that all three instances are running.

Run `docker attach tc-worldserver` in PowerShell, followed by `account create <username> <password>` and `account set gmlevel <username> 3 -1`

Ctrl-P Ctrl-Q to detach from the docker container and get back out.\
However, those keybindings are already used in some cases, so you can instead Ctrl-C to get back out. This will kill the worldserver tho, so in that case, spin it back up with `docker compose up -d worldserver`

Edit `realmlist.wtf` in `Data/enUS/realmlist.wtf` to point to the server `set realmlist 127.0.0.1` (Use # to comment out any existing realmlist. Only one can apply at a time.)





## **Useful commands**
`docker compose exec -it db mysql -u root -proot world` get access to run queries in the SQL database\
`SELECT * FROM characters.custom_solocraft_character_settings;` check solocraft settings per char\
`UPDATE characters.custom_solocraft_character_settings SET enabled = 1 WHERE guid = 1;` enable solocraft

`docker restart <container_name_or_id>` to restart a container.

`docker exec -it <container_name_or_id> bash` get terminal access to container.

`apt update && apt install -y nano` install nano. `Ctrl+O` --> Enter --> `Ctrl+X` to save changes in Nano. `Ctrl+W` to search.
