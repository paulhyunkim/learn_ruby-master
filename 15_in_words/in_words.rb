class Fixnum
	@@numbers_hash = { # why can't i use @numbers_hash? doesn't its scope cover the method?
		0 => "zero",
		1 => "one",
		2 => "two",
		3 => "three",
		4 => "four",
		5 => "five",
		6 => "six",
		7 => "seven",
		8 => "eight",
		9 => "nine",
		10 => "ten",
		11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen",
    20 => "twenty",
    30 => "thirty",
    40 => "forty",
    50 => "fifty",
    60 => "sixty",
    70 => "seventy",
    80 => "eighty",
    90 => "ninety"
	}
	@@thousands_hash = { 
		0 => "",
		1 => "thousand ",
		2 => "million ",
		3 => "billion ",
		4 => "trillion "
	}

#special cases: zeroes; you only say zero at the end

	def in_words
		counter = 0
		word = ""
		stack = self.to_s.chars  # array of integers as strings
		if stack.join.to_i == 0
			word = "zero "
		else
			while stack.length > 0
				three_digit_word = ""
				temp = stack.pop(3).join.to_i  # integer
				if temp == 0
				else
					hundreds_digit = temp / 100
					tens_digit = (temp - (hundreds_digit * 100)) / 10
					ones_digit = (temp - (hundreds_digit * 100) - (tens_digit * 10))
					three_digit_word << "#{@@numbers_hash[hundreds_digit]} hundred " unless hundreds_digit == 0
					last_two_digits = "#{tens_digit}#{ones_digit}".to_i
					if last_two_digits == 0
					else
						if @@numbers_hash[last_two_digits]
							three_digit_word << "#{@@numbers_hash[last_two_digits]} "
						else
							three_digit_word << "#{@@numbers_hash[tens_digit * 10]} " unless tens_digit == 0
							three_digit_word << "#{@@numbers_hash[ones_digit]} " 
						end
					end
					three_digit_word << "#{@@thousands_hash[counter]}"r
				end
				word.prepend(three_digit_word)
				counter += 1
			end
		end
		word.chop
	end

end

