# KruigerNoNPC

A simple standalone FiveM resource that allows authorized staff to enable or disable ambient NPCs and NPC traffic server-wide using `/togglenpc`.

## Features

- Server-wide `/togglenpc` command
- ACE permission protected
- Disables ambient pedestrians
- Disables NPC-driven traffic
- Disables parked ambient vehicle density
- Synchronized state for all players
- New players receive the current state automatically
- Does not delete player peds or player vehicles
- Standalone
- No framework required
- No dependencies

## Installation

1. Download `KruigerNoNPC`.
2. Place `KruigerNoNPC` in your server's `resources` folder.
3. Add the following to `server.cfg`:

`ensure KruigerNoNPC`

4. Grant the toggle permission to the appropriate ACE group:

`add_ace group.admin kruiger.npc.toggle allow`

5. Restart the server.

## Usage

Run:

`/togglenpc`

Only players with `kruiger.npc.toggle` can use the command.

The command switches NPCs between enabled and disabled for the entire server.

## Configuration

Edit `config.lua`:

```lua
Config.Command = 'togglenpc'
Config.AcePermission = 'kruiger.npc.toggle'
Config.DefaultDisabled = true
```

## ACE Example

```cfg
add_ace group.admin kruiger.npc.toggle allow
```

If you use a Discord-to-ACE permission resource, grant `kruiger.npc.toggle` through that resource's ACE setup.

## Author

KruigerLabs

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
