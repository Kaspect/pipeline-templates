#!/usr/bin/python

#imports
import sys
import subprocess

#create output file
f = open("log.txt", "w")

#check if arguments appropriate and get the filename if so
if (len(sys.argv) == 1):
	print "usage: python compiler.py filename"
filename = str(sys.argv[1])

#Compile the file in knitr and save the output, including if there's an error.
try:
    r_output = subprocess.check_output(["r", "pipeline-templates/Docker/knitscript.r", filename])
except Exception, e:
    r_output = str(e.output)


#Compile the latex, but save the output if there's an error
try:
    latex_output = subprocess.check_output(["pdflatex -interaction nonstopmode *.tex"], shell=True, stderr=subprocess.STDOUT)
except Exception, e:
    latex_output = str(e.output)

#Combine the outputs and write them to log.txt
final_output = r_output + latex_output
f.write(final_output)