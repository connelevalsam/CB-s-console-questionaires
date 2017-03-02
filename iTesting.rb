require_relative 'iNames'
require_relative 'iPerson'
require_relative 'iWrite'
require_relative 'iRegister'
#require_relative 'tryout'

save_file = ""
answers_file = ""
question_file = "Questions.txt"
lines = 0
questions = File.readlines(question_file)

question_number = lines

catch(:invalid_exp) do
	loop do
		puts "CB Questionaire\n1. Sign up\n2. Sign in"
		option = gets.to_i
		if option.equal?("bye")
			exit(0)
		end
		#
		if option == 1
			puts "Enter your first and second names"
			full_name = gets.chomp.capitalize
			puts "Enter your username"
			usrname = gets.chomp
			puts "Enter your password"
			psswod = gets.chomp
			#checking names
			m_names = Names.new
			f_names = Names.new
			final_m_names = m_names.maleNames
			final_f_names = f_names.femaleNames
			person = Person.new(full_name)
			#
			if person.name.split.find{ |name| final_m_names.include?(name) }
				my_name = "Mr "+person.name	
				full_name = my_name		
			elsif person.name.split.find{ |name| final_f_names.include?(name) }
				my_name = "Ms "+person.name
				full_name = my_name
			else 
				puts "name not found!\nAre you sure you exist?"
				#break
			end
			#checking username
			if File.exist?(usrname)
				puts "username already exist. Choose another"
				#break
			else
				signin = Registration.new(usrname,psswod,full_name)
			end
			#
		elsif option == 2
			puts "Enter username"
			username = gets.chomp
			puts "Enter password"
			password = gets.chomp
			#logins = Try.new
			#signin = logins.isLogin(username,password)
			if File.exist?(username)
				arr = File.readlines(username)#.first
				line = arr[0]
				if line.include?(password)#lines.gsub(/\s+/, password)#arr.include?(password)
					# Load current question number if user already answered some
					save_file = username+"_saves.bat"
					answers_file = username+"_ans.bat"
					if File.exist?(save_file)
						question_number = File.readlines(save_file).last.to_i+1
					end
					#
					while question_number <= questions.length do
						puts "Question #{question_number}:"
						puts questions[question_number]

						answer = gets
						#
						File.open(save_file, 'w') do |f|
							f.puts question_number
						end
						#
						File.open(answers_file, 'a') do |fi|
							fi.puts answer
						end
						question_number += 1
					end
					#
				else
					puts "Incorrect password"
				end
				#
			else
			puts "Incorrect username"
			end
			#
		else
			throw :invalid_exp if option != 1 && option != 2
		end
	end
end

=begin
# Load current question number if user already answered some
if File.exist?(cBsave)
  	question_number = File.readlines(cBsave).last.to_i
end

while question_number <= questions.length do
  puts "Question #{question_number}:"
  puts questions[question_number]

  answer = gets

  File.open(cBsave, 'w') do |f|
    f.puts question_number
  end
  File.open(cBfile, 'a') do |fi|
    fi.puts answer
  end
  question_number += 1
end
=end
