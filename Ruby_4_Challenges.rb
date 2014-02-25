@document = []

def print_menu
	puts "1. Create a new file, 'hello_from_ruby.txt'"
	puts "2. Input new data to 'hello_from_ruby.txt'"
	puts "'show'. Show contents of 'hello_from_ruby.txt'"
	puts "'save'. Save contents of 'hello_from_ruby.txt'"
	puts "'introspect'. Show program code: DEVELOPER ONLY"
	puts "9. Exit"
end

def process(selection)
	case selection
	when "1"
		create_file
	when "2"
		input_data
	when "show"
		show_document
	when "save"
		save_document
	when "introspect"
		show_source
	when "9"
		exit
	else
		puts "I don't know what you meant, try again"
	end
end

def interactive_menu
	loop do
		print_menu
		process STDIN.gets.chomp
	end
end

# 1. Write a Ruby program that creates a file called 'hello_from_ruby.txt'.

def create_file
	file = File.new"hello_from_ruby.txt","w"
	puts "-------------------------------------------"
	puts "Successfully created 'hello_from_ruby.txt'!"
	puts "-------------------------------------------"
end

# 2. Make your program ask for input and store that input for later use.

def input_data
	puts "Please enter any data you'd like to save"
	puts "To finish, just hit return twice"
	info = gets.chomp
	while !info.empty? do
		puts "Add a note to this entry"
		note = STDIN.gets.chomp
		note = "N/A" if note.empty?
		@document << {:info => info, :note => note}
		puts "Now we have #{@document.length} pieces of information. Any more?"
		info = STDIN.gets.chomp
	end
end

# 3. If the user types 'save', make your program save the input into the file.


def save_document
	file = File.open("hello_from_ruby.txt", "w")
	@document.each do |line|
		document_data = [line[:info], line[:note]]
		document_line = document_data.join(",")
		file.puts document_line
	end
	file.close
	puts "-----------------------------------------"
	puts "Successfully saved 'hello_from_ruby.txt'!"
	puts "-----------------------------------------"
end

# 4. If the user types 'read', show the content of the file.

def show_document
	print_header
	print_document
	print_footer
end

def print_header
	puts "--------------------------------------------------------"
	puts "The information contained within 'hello_from_ruby.txt"
	puts "--------------------------------------------------------"
end

def print_document
	@document.each do |line|
		puts "#{line[:info]} - (#{line[:note]})"
	end
end

def print_footer
	puts "--------------------------------------------------------"
	puts "We have #{@document.length} lines of information."
	puts "--------------------------------------------------------"
end

# 5. If the user types 'introspect', make the program print itself to the screen.

def show_source
	File.open("Ruby_4_Challenges.rb", "r")
	contents = File.open("Ruby_4_Challenges.rb", "r"){|file| file.read }
	puts contents
end

interactive_menu