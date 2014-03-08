class Array
	def sum
		empty? ? 0 : reduce(:+) 
	end

	def square
		empty? ? [] : map { |x| x**2 }
	end

	def square!
		empty? ? [] : map! { |x| x**2 }
	end
end
