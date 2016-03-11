from flask import Flask, request
from flask_restful import Resource, Api

app = Flask(__name__)
api = Api(app)

<<<<<<< HEAD
class complier(Resource):

	def put(self):
 	# Get Repo name and git clone
 		repo = request.form['data']
 		cmd = 'git clone ' + repo
  		pipe = subprocess.Popen(cmd, shell=True)
 		pipe.wait()
 
 	# Get file location and call complie to create PDF and log
 		urlArr = repo.split(/)
 		relevantBit = urlArr[-1]
 		compiler.py(relevantBit+"\Root.Rtex")
 
 		# Put files in a zip
 		memory_file = BytesID()
 		with zipfile.ZipFile(memory_file, 'w' as zf:
 			zf.write('Root.pdf')
 			zf.write('log.txt')
 		memory_file.seek(0)
 
 
 		# Return Zip
 		strRet = urlArr(-1) + ".zip"
 		return send_file(memory_file, attachment_filename=strRet, as_attachment=True) 

api.add_resource(complier)
=======
todos = {}

class TodoSimple(Resource):
    def get(self, todo_id):
        return {todo_id: todos[todo_id]}

    def put(self, todo_id):
        todos[todo_id] = request.form['data']
        return {todo_id: todos[todo_id]}

api.add_resource(TodoSimple, '/<string:todo_id>')
>>>>>>> 4ac71f21d7f829a4f0e3af598bafa2caf0133ed9

if __name__ == '__main__':
    app.run(port = 5000)