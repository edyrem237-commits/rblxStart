# rblxStart

This is a brand-new Roblox game project. We write scripts on the computer (in files), then a tool called **Rojo** copies those scripts into Roblox Studio.

You do **not** need to be an expert. Follow this page from top to bottom the first time. After that, use the daily workflow.

## Game IDs

Keep these handy. They identify *this* game on Roblox.

| What | ID |
| --- | --- |
| **Place ID** (the playable place you publish to) | `99592521141754` |
| **Universe ID** (also called Experience ID; the whole game) | `10770290436` |

A **universe** can have more than one place (for example a lobby and a match). This project starts with one place.

## What Rojo is

**Rojo** is a bridge between your computer and Roblox Studio.

- On your computer, scripts live in the `src` folder and are saved with Git (so you can undo mistakes and work with other people).
- Rojo watches those files and **syncs** them into Studio while you work.
- When you press Play in Studio, you are testing the synced scripts.

Rojo does **not** publish the game. Publishing is a separate step in Studio (see [Publishing](#publishing)).

This project uses **Rojo v7**.

## One-time setup (Windows)

Do this once on each computer.

### 1. Install Git

If Git is not installed, install it from [https://git-scm.com](https://git-scm.com). You will use Git to download the project and share changes.

### 2. Install Rojo (pick one)

**Option A — Aftman or Rokit (good if you like the terminal)**

1. Install [Aftman](https://github.com/LPGhatguy/aftman) or [Rokit](https://github.com/rojo-rbx/rokit).
2. Open a terminal in this project folder.
3. Run `aftman install` (or `rokit install`).
4. Check it worked: `rojo --version` should show Rojo 7.

This repo already lists the tool versions in `aftman.toml`.

**Option B — VS Code extension (good if you use VS Code / Cursor)**

1. Install the **Rojo** extension from the Extensions view.
2. The extension can start the Rojo server from a button. It does **not** always add `rojo` to your PATH, so Option A is still useful for terminal commands like `rojo build`.

### 3. Install the Rojo plugin in Roblox Studio

Rojo has two halves: the server on your computer, and a plugin inside Studio.

Pick one way to install the plugin:

- If the `rojo` command works, run `rojo plugin install` in a terminal.
- Or install the **Rojo 7** plugin from the Creator Store / Roblox.com (search for “Rojo 7”).
- Or download the plugin file from [Rojo’s GitHub releases](https://github.com/rojo-rbx/rojo/releases) and put it in Studio’s plugins folder (**Plugins → Plugins Folder**).

Use the Rojo **7** plugin, not an older major version.

### 4. Open the project

```text
git clone <this-repo-url>
cd rblxStart
```

Then open the folder in VS Code, Cursor, or another editor.

## Daily workflow

Every time you sit down to work:

1. **`git pull`**  
   Get the latest files from GitHub so you are not editing an old copy.

2. **`rojo serve`**  
   Start Rojo in this project folder. Leave that terminal open. You should see a message that it is listening (usually on port 34872).

3. **Connect in the Studio plugin**  
   Open Roblox Studio. Open this game (Place ID `99592521141754`) or a local test place. In the Rojo plugin, click **Connect**. Studio should fill with the scripts from `src`.

4. **Press Play to test**  
   Play the game in Studio. In the Output window you should see a hello from the server and a hello from the client. The player list should show **Coins**.

When you edit a `.luau` file and save it, Rojo updates Studio. You usually do not need to reconnect.

Stop Rojo with `Ctrl+C` in the terminal when you are done.

## Where each folder ends up in Studio

`default.project.json` is the map from folders on disk to services in Studio.

| Folder on your computer | Place in Roblox Studio | Who runs it |
| --- | --- | --- |
| `src/shared` | **ReplicatedStorage → Shared** | Both server and client (modules) |
| `src/server` | **ServerScriptService → Server** | Server only |
| `src/client` | **StarterPlayer → StarterPlayerScripts → Client** | Each player’s client |

How Rojo picks the script type from the file name:

- `Something.server.luau` → a **Script** (server)
- `Something.client.luau` → a **LocalScript** (client)
- `Something.luau` → a **ModuleScript** (you `require` it)

**Workspace and Terrain are not in this Rojo project on purpose.** Build maps, terrain, and most models in Studio. Rojo will not overwrite them.

## What NOT to do

- **Do not edit synced scripts directly in Studio.** Those scripts come from the files in `src`. The next sync will overwrite Studio edits. Change the files on your computer instead, then let Rojo sync.
- **Do not put the map into Rojo unless the team agrees.** Build rooms, terrain, and props in Studio. Scripts stay in `src`.
- **Do not commit place files.** `*.rbxl` and `*.rbxlx` are in `.gitignore`. They are big Studio saves / build output, not the source of truth for scripts.
- **Do not publish a broken playtest.** Test in Studio first (see below).
- **Do not have two people publish at the same time.** The last publish wins and can wipe the other person’s Studio-only work (maps, lighting, and so on).

## Publishing

Rojo syncs scripts into *your* Studio session. It does **not** update the live game by itself.

1. Sync with Rojo and press **Play**. Confirm the hellos print and **Coins** shows on the player list.
2. Walk the map. Fix problems before you publish.
3. In Studio, use **File → Publish to Roblox** (or **Publish to Roblox As…** the first time).
4. Publish to Place ID `99592521141754` (universe / experience `10770290436`).
5. **Only one person publishes at a time.** Say so in chat or a team channel before you publish. If two people publish, one upload can overwrite the other.

If you only changed scripts that live in `src`, still publish from a Studio session that is connected to Rojo so the live place gets those scripts. If you changed the map in Studio, publish from the Studio session that has the map.

## Extra tools (optional)

These versions are pinned in `aftman.toml`:

- **Selene** (`selene.toml`) — finds common script mistakes.
- **StyLua** (`stylua.toml`) — formats Luau so the team’s code looks the same.

```text
selene src
stylua src
```

## Glossary

Short definitions of Roblox and Git words live in [docs/GLOSSARY.md](docs/GLOSSARY.md).
