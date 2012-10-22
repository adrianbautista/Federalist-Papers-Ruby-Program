file_path = '/Users/Adrian/Documents/College/computer_science/The Federalist Papers crlf.txt' 
#set a variable equal to the the complete federalist paper text file.
text = File.open(file_path, "r") 
#open the complete federalist paper text in read access mode

counter = 0 
#intialize counter variable for file name
current_name = "Federalist Paper No. " + counter.to_s 
#initialize a name variable for the output files that will countain the paper number
file_papers = File.new(current_name + ".txt", "w") 
#creates "Federalist Paper No. 0" file.  

while (line = text.gets)
	file_papers.puts(line) unless line.include?("FEDERALIST") 
	#puts string line from full text except if it contains "FEDERALIST" because that is the start of a new paper.
	
	if line.include?("FEDERALIST") 
	#perform following loop if FEDERALIST is found to start a new file	
		file_papers.close 
		#closes and saves the currently captured Federalist Paper
		counter = counter + 1 #increases counter by 1
		current_name = "Federalist Paper No. " + counter.to_s 
		#updates the file name to the next paper no.
		file_papers = File.new(current_name + ".txt", "w") 
		#creates new file with current name to store the next federalist paper
		file_papers.puts(current_name) 
		#applies a title of the current paper to the file's content
	end
	
end

file_papers.close 
#close the last federalist paper text file
File.delete("Federalist Paper No. 0.txt") 
#deletes the first file because it only contains the string "FEDERALIST NO. 1"

puts "NICE JOB!" 
#to maintain morale and give the programmer a virtual pat on the back. 
