# StumpWM Battery

Battery information module for StumpWM

## Requirements

- [trivial-battery](https://github.com/pokepay/trivial-battery) package installed

## Installation

```bash
cd ~/.stumpwm.d/modules/
git clone https://github.com/Junker/stumpwm-battery battery
```
`
```common-lisp
;; (ql:quickload "trivial-battery")
(stumpwm:add-to-load-path "~/.stumpwm.d/modules/battery")
(load-module "battery")
```

## Usage

```common-lisp
(setf battery:*notify-levels* '((10 . :critical)
                                (30 . :warning)
                                (45 . :warning)))
(battery:init)
```

### Commands

- `battery-status`

### Parameters

- `battery:*check-interval*` - Interval in seconds for battery check (Default: 30). 
- `battery:*notify-levels*` - List of notification levels. Set it to NIL to disable notifications.
- `battery:*percentage*` - Current battery percentage.
- `battery:*chargingp*` - Current battery charging status.

## Modeline

`%B` - battery formatter

### Parameters for modeline

- `battery:*modeline-fmt*` - format of battery modeline (default: "%c %b")
  - `%c` - battery charging status ("+/-")
  - `%b` - battery percentage
