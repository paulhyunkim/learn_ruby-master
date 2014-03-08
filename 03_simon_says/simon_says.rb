def echo(word)
	word
end

def shout(word)
	word.upcase
end

def repeat(word, int = 2)
	string = ""
	int.times {string << "#{word} "}
	string.strip
end

def start_of_word(word, int = 1)
	word[0...int]
end

def first_word(string)
	string.split(" ")[0]
end

def titleize(string)
	little_words = ["and", "or", "the", "over", "to", "the", "a", "an", "but"]
	string.capitalize!
	string.split(" ").map { |word| little_words.include?(word) ? word : word.capitalize }.join(" ")
end
