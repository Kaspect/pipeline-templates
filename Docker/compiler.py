#!/usr/bin/python

import sys
import subprocess
f = open("log.txt", "w")
if (len(sys.argv) == 1):
	print "usage: python compiler.py filename"
filename = str(sys.argv[1])
r_output = subprocess.check_output(["r", "Docker/knitscript.r", filename])
try:
     latex_output = subprocess.check_output(["pdflatex -interaction nonstopmode *.tex"], shell=True, stderr=subprocess.STDOUT)
except Exception, e:
       latex_output = str(e.output)
final_output = r_output + latex_output
f.write(final_output)