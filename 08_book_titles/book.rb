Articles = %w{a an the and in of}

class Book

	def title
		@book.capitalize!
		@book.split(' ').map { |word| Articles.include?(word) ? word : word.capitalize }.join(' ')
	end

	def title= book
		@book = book
	end

end
