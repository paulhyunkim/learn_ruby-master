def translate(string)
	words = string.split(" ")
	words.map! { |word| 
		if word[0] =~ /[aeiou]/i
			pig = ''
		else
			pig = word.slice!(/[^aeiou]+/)
			if pig[-1] == 'q' && word[0] == 'u'
				pig << word.slice!(0)
			end
		end
		word + pig + 'ay'
	}
	words.join(' ')

end

# can i refactor this down further?
# how about using regex /^[^aeiou]+/? will this pull the leading consonants?
