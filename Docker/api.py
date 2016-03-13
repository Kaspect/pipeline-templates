from flask import Flask, request
from flask_restful import Resource, Api			
import sys
import subprocess
import logging


app = Flask(__name__)
api = Api(app)

class compiler(Resource):

	def get (self) :
	
		print("Started get command")
		return "Hello!"

	def put(self):
		logging.warning("Started put command")
		try:
			# Get Repo name and git clone
			repo = request.form['data']
			logging.warning("Got repo address from data")
			cmd = 'git clone ' + repo
			pipe = subprocess.Popen(cmd, shell=True)
			
			logging.warning("Started clone command")
			pipe.wait()
			
			logging.warning("Finished clone command")

			# Get file location and call complie to create PDF and log
			urlArr = repo.split("/")
			relevantBit = urlArr[-1]
			filename = relevantBit+"/Root.Rtex"
			logging.warning("Got address of Rtex in repo")


			#create output file
			f = open("log.txt", "w")

			#Compile the file in knitr and save the output, including if there's an error.
			try:
				r_output = subprocess.check_output(["r", "pipeline-templates/Docker/knitscript.r", filename])
			except Exception as e:
				r_output = str(e)

			#Compile the latex, but save the output if there's an error
			try:
				latex_output = subprocess.check_output(["pdflatex -interaction nonstopmode *.tex"], shell=True, stderr=subprocess.STDOUT)
				
			except Exception as e:
				latex_output = str(e)
				#Combine the outputs and write them to log.txt
				
			final_output = r_output + latex_output
			f.write(final_output)

			#compiler.py(relevantBit+"\Root.Rtex") 
			# Put files in a zip
			memory_file = BytesID()
			with zipfile.ZipFile(memory_file, 'w') as zf:
				zf.write('Root.pdf')
				zf.write('log.txt')
				logging.warning("Wrote to zip")
			memory_file.seek(0)


			# Return Zip
			strRet = urlArr[-1] + ".zip"
			return send_file(memory_file, attachment_filename=strRet, as_attachment=True) 

		except Exception as e:
			logging.warning(str(e))
			return (str(e))
			
api.add_resource(compiler,"/")


if __name__ == '__main__':
    app.run(host='0.0.0.0')