### Key Packages
evil-mode, fuzzy-ido, helm, smex, key-chord, hydra, company-mode, ggtags
### Overview
This emacs configuration is a fork off of [Bin Chen](https://github.com/redguardtoo/emacs.d)'s vim-oriented emacs.d, which is in turn inspired by [Steve Purcell](https://github.com/purcell/emacs.d)'s classic setup. Refer to Bin Chen's repo for more info on how this setup is structured. As time goes by, every emacs setup tends to accumulate tons of unused keymappings. Therefore, the following commands/keybindings documented here are the ones that are my all-time favorites, which I use almost every single day.
### Most Essential
Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>C-c f</kbd>   | helm-for-files. Allows you to find/switch-to/open a file from anywhere in your filesystem. Searches existing buffers, then recentf list, and finally taps into Unix locate.
<kbd>C-c i</kbd>   | helm-semantic-or-imenu. Displays a list of all functions and variables in the current buffer. Try typing "fun" followed by SPC to filter and view only functions, then enter the function name and press RET.
<kbd>, d j</kbd>   | dired-jump. Instantly opens up dired buffer for the folder of the current file. Press `^` to go up a directory, `>`/`<` to cycle through folders, `a` to launch an ag (grep) search, `d x` to mark and delete a file, `C` to copy, `R` to rename, and `RET` to visit a file. More dired info [here](http://ergoemacs.org/emacs/file_management.html).
<kbd>HG</kbd>      | [helm-swoop](https://github.com/ShingoFukuyama/helm-swoop) on word under cursor. Shows all lines containing the word in current buffer, allow you to cycle through them with `C-n`/`C-p`. `C-c C-e` lets you edit the instances right there in the buffer.
<kbd>C-c p A</kbd> | projectile-ag. Grep for a specified string in all files from the current buffer's git repository. [Ag](https://github.com/ggreer/the_silver_searcher), the silver searcher, is a more efficent grep program that must be installed.
<kbd>SPC</kbd>     | [ace-jump-mode](https://bbbscarter.wordpress.com/2012/09/13/emacs-bits-and-bobs/). In ace-jump-mode, press any character that you want your cursor jump to on the screen and then press the corresponding character that shows up. Once activated, lets you jump anywhere on your screen in usually two keystrokes.
### Common Emacs Commands 
Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>C-;</kbd>     | comment-or-uncomment-region-or-line. A saner way of commenting code in emacs.
<kbd>u</kbd>       | undo-tree-undo. Lets you undo the latest change.
<kbd>M-S--</kbd>   | undo-tree-redo. Lets you redo the latest change.
<kbd>C-s</kbd>     | isearch-forward. Search file for word. Currently uses ace-isearch, which changes over to ace-jump for single character searches or helm-swoop for longer searches. Press `M-i` while in isearch to switch to helm-swoop and press `M-r` to switch to isearch-forward-regexp.
<kbd>qr</kbd>      | query-replace. Lets you enter a string and the string to replace it with. Press `y` to change the current selection and go to next instance, `n` to skip and go to next instance, and `,` to replace, but stay at the current location.
<kbd>M-c</kbd>     | endless/capitalize. Capitalize the word after the cursor.
<kbd>M-l</kbd>     | endless/downcase. Change the word after the cursor to lowercase.
<kbd>M-u</kbd>     | endless/downcase. Change the word after the cursor to uppercase.
<kbd>C-x f</kbd>   | recentf-open-files. Lists your most recent files opened. Press a number from 0-9 to open the file you want.
<kbd>bj</kbd>      | bookmark-jump. Extremely useful for switching to files and locations you visit frequently.
<kbd>C-x r m</kbd> | bookmark-set. Lets you name and set a bookmark at the current position in the buffer. You can even bookmark a dired-buffer. Once you exit emacs normally or run bookmark-save, the bookmark is automatically stored in a file.
<kbd>C-x \* \*</kbd> | calc. Launches emacs's special reverse-polish notation (RPN) calculator. Use `RET` to dup the stack and `TAB` to swap, kind of like Forth. Enter "16#<hexnum>" to enter a hex number and display hex with `d 6`. Change back to base 10 with `d 0`. Logs, square roots, trig, and bitwise operations are all supported!
<kbd>C-l</kbd>     | recenter-top-bottom. Centers the screen around where your cursor is. Handy for when you can't see the rest of your code.
<kbd>C-g</kbd>     | keyboard-quit. Cancel whatever command you are currently in. Used almost all the time when you do something accidentally or want to exit some mode.
<kbd>M-x package-install</kbd> | Install a package from the MELPA server. Use `M-x package-list-packages` to browse the full list.
<kbd>M-x load-theme</kbd>| Lets you select a color theme. Some pretty ones are tomorrow-night-paradise, solarized, monokai (a la Sublime Text), wombat, and tango-dark. Find the motherlode at [emacsthemes.caisah.info](http://emacsthemes.caisah.info/).

### Common Vim Commands
See this [tutorial](http://linuxgazette.net/152/srinivasan.html) for some nice examples about text objects. This [reference](http://www.yolinux.com/TUTORIALS/LinuxTutorialAdvanced_vi.html) has just about all the essentials. The amazing thing is that almost all of them are supported by evil-mode.
### Expansion 
Most of these commands can be issued repeatedly, if the first match isn't what you wanted.

Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>C-n</kbd>     | evil-paste-pop-next. Completes the current word with the closest match after your cursor.
<kbd>C-p</kbd>     | evil-paste-pop-prev. Completes the current word with the closest match before your cursor.
<kbd>M-/</kbd>     | hippie-expand. Completes the current word with the closest match, as determined by hippie. Hippie-expand uses sematnic and a list of sources to perform the complete. It even works inside query-replace, so you don't have to type long strings.
<kbd>C-x l</kbd>   | hydra-C-x-extended/my-expand-lines. Do full line completion, like C-x C-l in vim.


### Advanced/Less Used
In progress...
### Vanilla Emacs
In progress...
### Additional Packages
In progress...
### Keybinding Examples
`C-x` means Ctrl-x

`M-x` means Alt-x

`, d j` means press the leader key (currently ","), followed by d and j.
* this is a feature of the evil-leader package, part of evil-mode

`qr` means press q, quickly followed by r.
* this is a key-chord; the order of the keys actually doesn't matter, so rq would do the same thing.

### Non-emacs related tips ###
Rebind your Right Alt to Ctrl to save your pinky! Your tucked thumb can push it with no complaints.

Use `RAlt::Ctrl` in AutoHotKey on Windows, or `setxkbmap -option ctrl:ralt_rctrl` in Linux.

