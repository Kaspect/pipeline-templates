from flask import Flask, request
from flask_restful import Resource, Api

app = Flask(__name__)
api = Api(app)

class compiler(Resource):

	def get (self) :
		return "Hello!"

	def put(self):
 	# Get Repo name and git clone
 		repo = request.form['data']
 		cmd = 'git clone ' + repo
  		pipe = subprocess.Popen(cmd, shell=True)
 		pipe.wait()
 
 	# Get file location and call complie to create PDF and log
 		urlArr = repo.split("/")
 		relevantBit = urlArr[-1]
 		compiler.py(relevantBit+"\Root.Rtex")
 
 		# Put files in a zip
 		memory_file = BytesID()
 		with zipfile.ZipFile(memory_file, 'w') as zf:
 			zf.write('Root.pdf')
 			zf.write('log.txt')
 		memory_file.seek(0)
 
 
 		# Return Zip
 		strRet = urlArr(-1) + ".zip"
 		return send_file(memory_file, attachment_filename=strRet, as_attachment=True) 

api.add_resource(compiler,"/")


if __name__ == '__main__':
    app.run(host='0.0.0.0')