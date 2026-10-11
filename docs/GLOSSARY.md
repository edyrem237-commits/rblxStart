# Glossary

Plain-English meanings of words you will see in this project. One or two sentences each.

## Experience / Universe ID vs Place ID

An **experience** (also called a **universe**) is the whole Roblox game: its name, pages, game passes, and every place inside it. This project’s universe ID is `10770290436`.

A **place** is one playable level or world inside that experience. This project’s place ID is `99592521141754`. Players join a place; the universe is the container around it.

## Workspace

**Workspace** is the 3D world: parts, terrain, models, and things players can see and touch. We keep Workspace out of Rojo so maps you build in Studio are not overwritten by files.

## ReplicatedStorage

**ReplicatedStorage** is a storage folder that both the server and every client can see. Shared modules (like `src/shared/Config.luau`) live here so both sides can `require` the same code.

## ServerScriptService

**ServerScriptService** holds scripts that run only on the server. Players cannot see or steal these scripts. Our server folder syncs to `ServerScriptService/Server`.

## StarterPlayerScripts

**StarterPlayerScripts** sits under **StarterPlayer**. When a player joins, Roblox copies the LocalScripts here into that player so their client can run them. Our client folder syncs to `StarterPlayer/StarterPlayerScripts/Client`.

## Script vs LocalScript vs ModuleScript

A **Script** runs on the server (file name ends with `.server.luau` in this project).

A **LocalScript** runs on one player’s device (file name ends with `.client.luau`).

A **ModuleScript** does not run by itself. Other scripts `require` it to reuse functions and data (plain `.luau` files, like `Config.luau`).

## RemoteEvent / RemoteFunction

A **RemoteEvent** is a one-way message between the server and a client (for example “the player clicked the shop”).

A **RemoteFunction** is a request that waits for an answer (for example the client asks the server “how many coins do I have?” and the server replies). Never trust the client: the server must check anything important.

## DataStore

A **DataStore** is Roblox’s cloud save. The server uses it to remember data between sessions, such as coins or inventory. DataStores only work on the server, and you should not write to them every second.

## leaderstats

**leaderstats** is a special folder you put inside a player. Values inside it (like **Coins**) show on the default Roblox player list / leaderboard. Our server script creates this when a player joins.

## Luau

**Luau** is Roblox’s scripting language. It is based on Lua, with extra types. Files here use `--!strict` so Studio and tools warn you about type mistakes.

## Rojo

**Rojo** is the tool that copies files from your computer into Roblox Studio (and can build a `.rbxl` place file). This project uses Rojo version 7. See the README for setup and the daily workflow.

## Sync

**Sync** means Rojo is connected and keeping Studio matching your files. When you save a script on disk, the matching script in Studio updates. Studio edits to those synced scripts will be overwritten on the next sync.

## Publish

**Publish** uploads the place from Studio to Roblox so real players can play that version. Sync is only on your machine; publish is what updates the live game. Test first, and only one person should publish at a time.

## Open Cloud

**Open Cloud** is Roblox’s official web API for tools and servers (for example uploading a place, reading DataStores, or running CI). You talk to it with API keys. You do not need it for the normal Rojo → Studio → Play loop.

## CCU

**CCU** means **concurrent users**: how many people are in the experience *right now*. It goes up and down during the day.

## DAU

**DAU** means **daily active users**: how many unique people played at least once in a day. It is a common “is the game healthy?” number.

## Retention

**Retention** is the share of players who come back later (for example “day 1 retention” = played today and also played again tomorrow). High retention usually matters more than a one-day spike in CCU.

## Robux

**Robux** is Roblox’s currency. Players spend it on game passes, developer products, and avatar items. You can also spend Robux on ads and some creator tools.

## DevEx

**DevEx** (Developer Exchange) is how Roblox lets eligible creators turn earned Robux into real money. There are account, country, and minimum-amount rules; it is not a normal cash-out for new games on day one.

## Game pass

A **game pass** is a one-time purchase that the player owns forever (for example a VIP pass). After they buy it, you check `MarketplaceService` to see if they own it.

## Developer product

A **developer product** (dev product) is a repeatable purchase, like a coin pack. The same player can buy it many times. The server should grant the reward only after a successful receipt process.

## PR

A **PR** (pull request) is a request on GitHub (or similar) to merge a branch into another branch, usually `main`. Other people can read the diff and comment before it is merged.

## Commit

A **commit** is a saved snapshot of your files in Git, with a short message. Make a commit when a change works, so you can go back if the next change breaks something.

## Branch

A **branch** is a separate line of Git history. You can try work on `cursor/my-feature-9d99` without changing `main` until a PR is merged.

## Pull

**Pull** (`git pull`) downloads new commits from GitHub and updates your local files. Do this at the start of a work session so you are not editing an old copy.
