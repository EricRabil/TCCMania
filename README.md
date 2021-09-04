# TCCMania

```
Usage: tcc-mania <intent> <service> [options]

manipulate the TCC database from the command-line

list of services:
- addressBook
- calendar
- reminders
- twitter
- facebook
- sinaWeibo
- liverpool
- ubiquity
- tencentWeibo
- photos
- photosAdd
- shareKit
- microphone
- camera
- willow
- mediaLibrary
- siri

AMFI must be disabled as this requires the private entitlement com.apple.private.tcc.manager

Examples:

tcc-mania grant camera -p /Applications/Brave\ Browser.app
tcc-mania revoke microphone -i com.hnc.Discord
tcc-mania reset photos -p /Applications/Twitter.app

Options:
  -i, --bundle-id <value>    Path to the bundle ID to set TCC access for
  -h, --help                 Show help information
  -p, --path <value>         Path to the executable to set TCC access for
```
