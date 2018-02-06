# MATLAB Install Notes

## Color scheme
I have a custom color scheme for MATLAB which I manage via `matlab-schemer`. To
transfer my scheme from one computer to another, do:
* On the original computer, add matlab-schemer to the MATLAB path. In MATLAB,
  run `path(path,'/path/to/matlab-schemer'`.
* Run `schemer_export` to export the current scheme to a file.
* Copy the file to the new computer.
* Add matlab-schemer to the MATLAB path on the new computer and run
  `schemer_import '/path/to/scheme/file'`.

## Font
The font does not come along with the scheme. Go into Preferences > Fonts and
manually select the desired font. I like Nimbus Mono L Bold 12pt.

## Keybindings
The default is emacs, but I prefer to change this to Windows. vim keybindings
are not supported. Go to Preferences > Keyboard > Shortcuts to change.
