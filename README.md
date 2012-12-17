less-basher
===========

Bash script that uses lessc to compile all the .less files within a folder.


Requires
---------
Needs the lessc command line tool.  See [here](http://lesscss.org/).


Usage
------

	less-basher.sh /path/to/input/folder /path/to/output/folder

Takes two arguments, the input folder with the LESS files you wish to compile, and the folder you wish to save the compiled CSS.

The script will decend into the input folder and its sub-folders compiling .less files into .css files and saving them into the output folder.  It will skip any .less files in any folder named "includes" and will overwrite any existing files in the output folder.

Directory structure of the outputed CSS files is preserved to match the LESS files.
