require_relative 'iWrite'
class Registration
	attr_accessor :username, :password, :real_name

	def initialize(uname, pword,rname)
		create(uname,pword,rname)
	end
	def create(uname,pword,rname)
		username = uname
		password = pword + "\n"
		real_name = rname
		
		regs = File.new(username, 'w')
		credential = password + real_name
		regs = File.open(username, 'w'){ |file|
			file.puts credential
		}
		
	end
end
