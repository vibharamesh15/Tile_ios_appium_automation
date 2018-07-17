# tileapp_e2e
Tile App end-to-end automation suite

Smoke tests and other things using robots

# Setup

- Ruby 2.4.0 (management through `rbenv` is highly encouraged)
- RSpec
- Appium Beta
- https://github.com/mykola-mokhnach/Appium-iOS-Inspector

# Running

## All scenarios, local device

- `$ rake ios_local`

## All scenarios, remote server
- `$ UDID=<device_uuid> rake ios`

# Currently implemented scenarios

- [x] Login to Unconfirmed Account
- [x] Login to Confirmed Account
- [x] Logout
- [x] Ring Tile
- [ ] Ring Tile x3, Custom Ringtone, Cancel
- [ ] Ring Tile x3, Custom Ringtone, Flash => Blocked
- [x] Mark as Lost
- [x] Mark as Lost, Cancel [Part of the above scenario]
- [x] Edit Tile Name
- [x] Edit Tile Archetype
- [ ] Edit Tile Photo
- [x] Hide Tile
- [x] Show Tile
- [x] Share Tile
- [x] Share Tile, Unshare
- [ ] Remove Phone
- [x] Hide Phone from List
- [x] Show Phone in Tile List
- [x] Switchings Tabs
- [x] Reverse Ring via Tile Clicker
- [ ] Register Account
- [x] Register Account - Duplicate# Tile_ios_appium_automation
