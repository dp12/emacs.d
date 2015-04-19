## Key Packages
evil-mode, flx-ido, helm, smex, key-chord, hydra, company-mode, ggtags
## Overview
This emacs configuration is a fork off of Bin Chen's vim-oriented [emacs.d](https://github.com/redguardtoo/emacs.d), which is in turn inspired by Steve Purcell's [classic setup](https://github.com/purcell/emacs.d). Refer to Bin Chen's [repo](https://github.com/redguardtoo/emacs.d) for more info on how this setup is structured. As time goes by, every emacs setup tends to accumulate tons of unused keymappings. Therefore, the following commands/keybindings documented here are the ones that are my all-time favorites, most of which I use every single day.
## Keybindings Reference
### Most Essential
Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>C-c f</kbd>   | helm-for-files. Allows you to find/switch-to/open a file from anywhere in your filesystem. Searches existing buffers, then recentf list, and finally taps into Unix locate.
<kbd>C-c i</kbd>   | helm-semantic-or-imenu. Displays a list of all functions and variables in the current buffer. Try typing "fun" followed by `SPC` to filter and view only functions, then enter the function name and press `RET`.
<kbd>, d j</kbd>   | dired-jump. Instantly opens up dired buffer for the folder of the current file. Press `^` to go up a directory, `>`/`<` to cycle through folders, `a` to launch an ag (grep) search, `d x` to mark and delete a file, `C` to copy, `R` to rename, and `RET` to visit a file. More dired info [here](http://ergoemacs.org/emacs/file_management.html).
<kbd>HG</kbd>      | [helm-swoop](https://github.com/ShingoFukuyama/helm-swoop) on word under cursor. Shows all lines containing the word in current buffer, allow you to cycle through them with `C-n`/`C-p`. `C-c C-e` lets you edit the instances right there in the buffer.
<kbd>C-c p A</kbd> | projectile-ag. Grep for a specified string in all files from the current buffer's git repository. [Ag](https://github.com/ggreer/the_silver_searcher), the silver searcher, is a more efficent grep program that must be installed as a prerequisite.
<kbd>M-.</kbd>     | ggtags-find-tag-dwim. If the cursor is over a function call, jump to its definition. Pop back to your original cursor location with `M-*` (it's a stack, so you can pop out repeatedly). If the cursor is over a function definition, it finds the first reference (place where function is used). Use `M-n` and `M-p` to navigate between multiple references. Requires GNU Global to be installed.
<kbd>SPC</kbd>     | [ace-jump-mode](https://bbbscarter.wordpress.com/2012/09/13/emacs-bits-and-bobs/). In ace-jump-mode, press any character that you want your cursor jump to on the screen and then press the corresponding character that shows up. Once activated, lets you jump anywhere on your screen in usually two keystrokes.
### Common Emacs Commands 
Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>C-;</kbd>     | comment-or-uncomment-region-or-line. A saner way of commenting code in emacs.
<kbd>u</kbd>       | undo-tree-undo. Lets you undo the latest change.
<kbd>M-S--</kbd>   | undo-tree-redo. Lets you redo the latest change.
<kbd>C-s</kbd>     | isearch-forward. Search file for word. Currently uses ace-isearch, which changes over to ace-jump for single character searches or helm-swoop for longer searches. Press `M-i` while in isearch to switch to helm-swoop and press `M-r` to switch to isearch-forward-regexp.
<kbd>qr</kbd>      | query-replace. Lets you enter a string and the string to replace it with. Press `y` to do replace on the current selection and go to next instance, `n` to skip replacing and go to next instance, and `,` to replace, but stay at the current location.
<kbd>M-c</kbd>     | endless/capitalize. Capitalize the word after the cursor.
<kbd>M-l</kbd>     | endless/downcase. Change the word after the cursor to lowercase.
<kbd>M-u</kbd>     | endless/upcase. Change the word after the cursor to uppercase.
<kbd>M-m</kbd>     | back-to-indentation. Moves the cursor back to the first non-whitespace character on a line. Useful when you want to insert text at the start of an indented line.
<kbd>C-x f</kbd>   | recentf-open-files. Lists your most recent files opened. Press a number from 0-9 to open the file you want.
<kbd>bj</kbd>      | bookmark-jump. Extremely useful for switching to files and locations you visit frequently.
<kbd>C-x r m</kbd> | bookmark-set. Lets you name and set a bookmark at the current position in the buffer. You can even bookmark a dired-buffer. Once you exit emacs normally or run bookmark-save, the bookmark is automatically stored in a file.
<kbd>C-x \* \*</kbd> | calc. Launches emacs's special reverse-polish notation (RPN) calculator. Use `RET` to dup the stack and `TAB` to swap, kind of like Forth. Enter "16#" followed by a number to input hex and display hex with `d 6`. Change back to base 10 with `d 0`. Logs, square roots, trig, matrix, and bitwise operations are all supported!
<kbd>C-l</kbd>     | recenter-top-bottom. Centers the screen around where your cursor is. Handy for when you can't see the rest of your code.
<kbd>C-g</kbd>     | keyboard-quit. Cancel whatever command you are currently in. Used almost all the time when you do something accidentally or want to exit some mode.
<kbd>M-x package-install</kbd> | Install a package from the MELPA repository. Alternatively, use `M-x package-list-packages` to browse the full list.
<kbd>M-x load-theme</kbd>| Lets you select a color theme. Some pretty ones are tomorrow-night-paradise, solarized, monokai (a la Sublime Text), wombat, and tango-dark. Find the motherlode at [emacsthemes.caisah.info](http://emacsthemes.caisah.info/).

### Common Vim Commands
See this [tutorial](http://linuxgazette.net/152/srinivasan.html) for some nice info about text objects. For something comprehensive, this [reference](http://www.yolinux.com/TUTORIALS/LinuxTutorialAdvanced_vi.html) has just about all the essentials. The amazing thing is that almost all of them are supported by evil-mode.

Because of space, I can't cover all of the basic commands in vim, but some of the ones I use a lot are `ddp` and `xp` to transpose words and characters, `f`, `t`, `F`, `T` followed by a character to jump to it, `C-v` followed by `A` or `I` for column editing, `:` followed by a line number to goto line, `A`, `o`, `V`, `ciw`, `vi)`, `da)`, `=i}`, etc...

[evil-surround](https://github.com/timcharper/evil-surround) is also installed, allow you to wrap things in parentheses by first selecting the word/region and then typing `sb` or `s)`. `s(` will wrap things with spaces inserted, ( for example ). Also, any bracket or even letter can be used as the wrapping, e.g. `s*`, `s}`, or `sx`. 

Vim's buffer-local marks also work and come in handy. Press `m` followed by a single character to store a location in the buffer (I usually just hit `m m`), and jump to it with the backtick character (`` `m `` in this case). `C-o`, `C-i`, and ` `` ` take you back through cursor history, forward through cursor history, and to your last position, respectively.

It's also worth nothing that `C-z` is used to switch between evil-mode and normal emacs mode, should you ever need the latter.
### Auto-completion 
Most of these commands can be issued repeatedly, if the first match isn't what you wanted. Additionally, company-mode will often detect something it can expand and either provide a candidate that can be accepted with `RET` or a popup list that you can select things from using Alt+some number.

Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>C-n</kbd>     | evil-paste-pop-next. Completes the current word with the closest match after your cursor.
<kbd>C-p</kbd>     | evil-paste-pop-prev. Completes the current word with the closest match before your cursor.
<kbd>M-/</kbd>     | hippie-expand. Completes the current word with the closest match, as determined by hippie. Hippie-expand uses semantic and a list of sources to perform the complete. It even works inside query-replace, so you don't have to type long strings.
<kbd>C-x l</kbd>   | hydra-C-x-extended/my-expand-lines. Do full line completion, like C-x C-l in vim.
<kbd>C-y</kbd>     | evil-copy-from-above. Copy characters from the line directly above.
<kbd>C-e</kbd>     | evil-copy-from-below. Copy characters from the line directly below.

### Advanced/Less Used
Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>M-S-right</kbd> | sp-slurp-hybrid-sexp. Press Alt+Shift+right arrow key to pull the next s-expression into your braces/brackets/parentheses. For example, if you have an `if {...}` statement followed by braces and you want to pull the next line into your if statement, issue this slurp command. This command is only the tip of the iceberg of smartparens, a package based on paredit, which is a [mind-boggling](http://emacsrocKs.com/e14.html) way of manipulating lisp and parentheses.
<kbd>C-c s w</kbd> | hydra-window/body. Swap windows (for example, if you split windows with `C-x 3`).
<kbd>g x</kbd>     | evil-exchange. If you have two words or regions you want to swap, select the first (using `v`) and press `g x`. Then, select the second and press `g x` to swap the two.
<kbd>q</kbd>     | evil-record-macro. Press `q` followed by a letter to store the macro in that register and start recording a macro. You can perform a complex series of actions and then press `q` again to stop recording. Then, press `@a` to execute the macro. Use `@@` to repeat the last macro. It's useful for "automating" repetitive text editing tasks.
<kbd>, x x</kbd>   | er/expand-region. Select the current region and expand by semantic units with `x`. Contract with `z`.
<kbd>, r b f</kbd> | revert-buffer. Reload the current buffer. If another program has modified the current file, this will reload the file.
<kbd>C-x n</kbd>   | git-gutter:next-hunk. Move to the next git-gutter hunk. For a file under git revision control, git-gutter will show you all lines that have been modified from the current HEAD. A hunk can be a line or collection of consecutive lines. Run git-gutter:previous-hunk with `C-x p`
<kbd>C-c right</kbd> | windmove-right. Move cursor to the window on the right. An easy way to switch between lots of windows. Works for up, down, and left as well. 
<kbd>C-x up</kbd>  | winner-undo. Restores the previous window configuration. For example, if you have two windows open and you change one of them to a different file, you can restore the old view with this command. To undo the effect of your undo, do `C-x down` to run winner-redo.
<kbd>m Q</kbd>     | In a dired buffer, mark all the files you want to replace text in with `m`. Then, press `Q` to do a query-replace-regexp over all the files at once! You can use `C-x s !` to save all files afterwards.
<kbd>W</kbd>       | wdired-change-to-wdired-mode. In a dired buffer, issue this command to make your dired buffer writable. You can then use all of emacs's text editing abilities to rename files. One of my favorite things to do is to change to wdired and then do a query-replace to rename files.
<kbd>C-x g</kbd>   | magit-status. Opens magit, an interface for running git commands. A good tutorial is located [here](http://vickychijwani.me/magit-part-i/) and a complete cheatsheet can be found [here](http://daemianmack.com/magit-cheatsheet.html). It's a lot easier to use magit to delete/ignore/stage files rather than having to type out the entire filename and path manually. You can even do interactive rebase with `E`.

### Vanilla Emacs
In progress...
## Additional Packages
In progress...
## Keybinding Examples
`C-x` means Ctrl-x

`M-x` means Alt-x

`M-S--` means Alt-Shift-minus key

`, d j` means press the leader key (currently ","), followed by d and j.
* this is a feature of the evil-leader package, part of evil-mode.

`qr` means press q, quickly followed by r.
* this is a key-chord; the order of the keys actually doesn't matter, so rq would do the same thing.

`C-x c f` means press Ctrl-x, let go, press c, let go, and press f. Of course, it happens much more quickly than it sounds!

## FAQ
In progress...

## Non-emacs related tips ###
Rebind your Right Alt to Ctrl to save your pinky! Your tucked thumb can push it with no complaints.

You can use `RAlt::Ctrl` in AutoHotKey on Windows, or `setxkbmap -option ctrl:ralt_rctrl` under Linux.

## Thoughts on emacs
* I learned about emacs and org-mode when I was a lowly sophomore, as yet unable to distinguish the Linux kernel from corn. Default emacs keybindings made me wonder what awful editor I had stumbled upon. They make the learning curve a lot steeper than it needs to be. As saying goes, "emacs is an operating system that lacks a decent text editor." Vim is that decent text editor, so using evil-mode from the get-go will make emacs much more enjoyable to use. 
* Using emacs feels like using a tool that is always under development. Very often, something new you've added will break or not work quite right, and emacs puts the burden on you to fix it. If you don't have a lot of setup time and want something rock-solid and fast, switch to vim instead. You can get ~90% of the features emacs has. However, it's less extensible (vimscript==blarg) and lacks a couple of advanced features, like wdired. Things like org-mode and eshell that have been "cloned" in vim often feel like cheaper, hacked-up versions of the real thing. In the end, the choice between vim and emacs is largely a matter of personality - a solid, no-frills surgical scalpel vs. an endlessly customizable Swiss army knife (to which you can attach a scalpel!). Your mileage may vary.