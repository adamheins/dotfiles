# MATLAB Install Notes

I have a custom color scheme for MATLAB which I manage via `matlab-schemer`. To
transfer my scheme from one computer to another, do:
* On the original computer, add matlab-schemer to the MATLAB path. In MATLAB,
  run `path(path,'/path/to/matlab-schemer'`.
* Run `schemer_export` to export the current scheme to a file.
* Copy the file to the new computer.
* Add matlab-schemer to the MATLAB path on the new computer and run
  `schemer_import '/path/to/scheme/file'`.
