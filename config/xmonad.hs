-- xmonad.hs
-- xmonad example config file.
--
-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--

import XMonad
import Data.Monoid
import System.Exit
import Graphics.X11.ExtraTypes.XF86
import XMonad.Actions.CycleWS
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers
-- import XMonad.Hooks.WindowSwallowing
import XMonad.Layout
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders (smartBorders, noBorders)
import XMonad.ManageHook
import XMonad.Util.EZConfig

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.

myTerminal      = "st"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels.

myBorderWidth   = 3

-- No borders in fullscreen
myLayoutHook    = smartBorders $ Tall 1 (3/100) (1/2) ||| Mirror (Tall 1 (3/100) (1/2)) ||| noBorders Full 

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.

myModMask       = mod4Mask

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
myWorkspaces    = ["1","2","3","4","5","6","7","8","9","0"]

-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor  = "#0088FF"
myFocusedBorderColor = "#FF7700"

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    -- launch a terminal
    [ ((modm,               xK_v     ), spawn $ XMonad.terminal conf)

    -- launch dmenu
    , ((modm,               xK_p     ), spawn "dmenu_run")

    -- close focused window
    , ((modm,               xK_q     ), kill)

    -- Quit XMonad
    , ((modm,               xK_Escape), io (exitWith ExitSuccess))

    -- Restart XMonad
    , ((modm .|. shiftMask, xK_r     ), spawn "xmonad --recompile; xmonad --restart")

    -- Open Zathura 
    , ((modm,               xK_r     ), spawn "zathura")

    -- Open Xournal 
    , ((modm,               xK_x     ), spawn "xournalpp")

    -- Rotate through available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)

    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)

    -- Move focus to previous window
    , ((modm,               xK_k     ), windows W.focusUp)

    -- Move focus to master window
    , ((modm,               xK_m     ), windows W.focusMaster)

    -- Swap focused and master windows
    , ((modm,               xK_Return), windows W.swapMaster)

    -- Shrink master area
    , ((modm,               xK_h     ), sendMessage Shrink)

    -- Swap focused and master windows
    , ((modm,               xK_l     ), sendMessage Expand)

    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)

    -- Toggle the status bar gap
    , ((modm,               xK_b     ), sendMessage ToggleStruts)

    -- Launch lf
    , ((modm,               xK_f    ), spawn "st -e vifm")

    -- Launch Firefox
    , ((modm,               xK_w     ), spawn "firefox")

    -- Launch Firefox Private Window
    , ((modm .|. shiftMask, xK_w     ), spawn "firefox --private-window")
    
    -- Launch Reaper
    , ((modm,               xK_d     ), spawn "reaper")

    -- Launch qt-jack
    , ((modm,               xK_a     ), spawn "qjackctl")

    -- Launch Thunderbird
    , ((modm,               xK_e     ), spawn "thunderbird")

    -- Launch Stremio
    , ((modm .|. shiftMask, xK_e     ), spawn "stremio")

    -- Launch Telegram
    , ((modm,               xK_i     ), spawn "telegram-desktop")

    -- Launch Steam
    , ((modm .|. shiftMask, xK_v     ), spawn "steam")

    -- Launch Discord
    , ((modm .|. shiftMask, xK_i     ), spawn "discord")

    -- Launch Krita
    , ((modm,               xK_g     ), spawn "krita")

    -- Screenshot a certain area and save to clipboard
    , ((modm,               xK_Print ), spawn "sleep 0.2; scrot -s -f ~/Pictures/Screenshot_%Y%m%d_%T.png -e 'xclip -selection c -t image/png < $f'")
    
    -- Next Workspace
    , ((modm,               xK_Up    ), nextWS)

    -- Previous Workspace
    , ((modm,               xK_Down  ), prevWS)

    ]

    ++

    -- Move and switch to worskpace N
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) ([xK_1 .. xK_9] ++ [xK_0])
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

----------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
-- --
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
--
       -- mod-button1, Set the window to floating mode and move by dragging
       [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                          >> windows W.shiftMaster))
--
--     -- mod-button2, Raise the window to the top of the stack
       , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
--
       -- mod-button3, Set the window to floating mode and resize by dragging
       , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                          >> windows W.shiftMaster))
--
--      -- you may also bind events to the mouse scroll wheel (button4 and button5)
        ]
-----------------------------------------------------------------------
-- Window rules

myManageHook = composeAll
  [ isFullscreen --> (doF W.focusDown <+> doFullFloat)
  , className =? "Thunderbird" --> doShift "0"
  , className =? "discord" --> doShift "0"
  , className =? "TelegramDesktop" --> doShift "0"
  , className =? "Transmission-gtk" --> doShift "0"
  , title =? "Media viewer" --> doFloat 
  , title =? " " --> doFloat
  , className =? "Steam" <&&> title =? "Stephen's Sausage Roll" --> doFullFloat
  , title =? "Brawlhalla" --> doFullFloat
  , title =? "Pony Island" --> doFullFloat
  , title =? "Manifold Garden" --> doFloat
  , className =? "zoom" <&&> title=? "Chat" --> doFloat
  , className =? "mpv" --> doFullFloat
  , className =? "firefox" <&&> title =? "Picture-in-Picture" --> doFloat
  ]

------------------------------------------------------------------------
---- Command to launch the bar.
myBar = "xmobar"
--
-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }
--
-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
main = xmonad =<< statusBar myBar myPP toggleStrutsKey (ewmh defaults)

-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults = def {
      -- simple stuff
        terminal            = myTerminal,
        layoutHook          = myLayoutHook,
        focusFollowsMouse   = myFocusFollowsMouse,
        clickJustFocuses    = myClickJustFocuses,
        borderWidth         = myBorderWidth,
        modMask             = myModMask,
        workspaces          = myWorkspaces,
        normalBorderColor   = myNormalBorderColor,
        focusedBorderColor  = myFocusedBorderColor,

      -- key bindings
        keys                = myKeys,
        mouseBindings       = myMouseBindings,

      -- hooks, layouts
        manageHook          = myManageHook
    }
