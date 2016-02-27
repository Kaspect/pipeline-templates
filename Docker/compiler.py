#!/usr/bin/python

import sys
import subprocess
f = open("log.txt", "w")
if (len(sys.argv) == 1):
	print "usage: python compiler.py filename"
filename = str(sys.argv[1])
r_output = subprocess.check_output(["r Docker/knitscript.r " + filename + ".Rtex"])
latex_output = subprocess.check_output(["pdflatex *.tex"])
f.write(r_Output + latex_output)