file_path = '/Users/Adrian/Documents/College/computer_science/Programs1to5/Federalist Paper No. 8.txt' 
#sets variable to an outputed file containing Federalist Paper No. 8

file = File.open(file_path, "r") 
#opens the text file in binary read mode.
whole_file = "" 
#intializes empty string variable to store the text file in
     
     while (input_line = file.gets) 
     #begins loop to import each line into whole_file
     	whole_file += input_line 
     	#amends whole_file with lastest string line if it is unique, thus capturing all of the text
     end 
     
arr_of_strings = whole_file.split(/\r\n|\n|\r/) 
#creates an array of strings by splitting whole_file into seperate sings following a parameter of return and line break or line breaks or returns.

index = 0 
#initialize a variable for the rows of strings in the array
character = 0 
#intialize a variable for individual characters within the string

while (index < arr_of_strings.size) 
#perform operation until the last string row

	while (character < arr_of_strings[index].size) 
	#performs operation until the last character in the string
		
		if (arr_of_strings[index][character].ord >= 65 and arr_of_strings[index][character].ord <= 90) 
		#performed if character is within the ASCII value range for uppercase letters
			upper_case = arr_of_strings[index][character].ord + 32 
			#converts uppercase to lowercase based on ASCII value difference
			arr_of_strings[index][character] = upper_case.chr 
			#saves new character
		elsif (arr_of_strings[index][character].ord >= 97 and arr_of_strings[index][character].ord <= 122) 
			#if character is within ASCII value range for lowercase, do nothing
		else
			arr_of_strings[index][character] = ' ' 
			#converts non-letter characters to empty spaces
		end
		
		character = character + 1 
		#proceeds to next character in string
	end
	
	character = 0 #restarts character variable
	index = index + 1 #proceeds to next string row
end

#arr_of_strings is now an array of strings containing only undercase lettered words or spaces

index = 0 
#resets index variable
index_line = 0 
#row variable for new words array
words = Array.new 
#intialize new array of word elements only

while (index < arr_of_strings.size)	
#ensures every line of arr_of_strings is processed

	if arr_of_strings[index].size > 1 
	#avoids processing blank lines
		words[index_line]= arr_of_strings[index].split(' ') 
		#store a line of words into an index of the words array, creating a multidimensional array
		#puts "words[" + index_words.to_s + "] => " + words[index_words].to_s, used for debugging
		index_line = index_line + 1 
		#proceed to next index in words
	end
	
	index = index + 1 #proceed to next line in arr_of_strings
end

stop_words = %w{the of and an although though from to any yet a but for be that in will it which by their not i this is are than may its as your have all on those at who my we shall you has with or they many if can so been would no} 
#produces a single dimensional array of stop words

words.flatten! 
#flattens all word elements into a one dimensional array

unique = words - stop_words 
#removes stop words from words array and stores result in a new array

frequency = Hash.new(0) 
#creates new hash that will store word frequency
unique.each { |unique| frequency[unique] +=1 } 
#creates a key for each word and adds a value to each key if the word was already found

#frequency = frequency.sort_by {|x,y| y } 
#sorts hash by frequency number
#frequency.reverse! #lists hash from greatest frequency to lowest

frequency = frequency.sort_by {|x,y| x } 
#sorts hash alphabetically

frequency.each { |unique, frequency| puts unique + ' ' + frequency.to_s } 
#displays word frequency

