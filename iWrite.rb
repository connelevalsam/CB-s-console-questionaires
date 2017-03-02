class WriteFile
    #def initilize(title, text)
    #    @title = title
    #    @text = text
   # end
    def write_method(title, text)
        
        @title = title+".txt"
        my_file = File.new(@title, 'w')
        #my_file.close
        puts "Creating file..."
        
        @text = text
        my_file = File.open(@title, 'w'){|file|
            file.puts @text
        }
        puts "done!"
    end
end
=begin
puts "Enter name of file here:"
title = gets.chomp
puts "Enter text here:"
text =gets.chomp
x = Write_file.new
x.write_method(title,text)
puts x
=end