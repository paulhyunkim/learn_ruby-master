class RPNCalculator
attr_accessor :calculator

	def initialize
		@numbers = []
	end

	def push(num)
		@numbers << num
	end

	def value
		@numbers[-1]
	end

	def plus
		raise_error if @numbers.length <= 1 
		@numbers.push(@numbers.pop + @numbers.pop) 
		# refactored from @numbers[-2] = @numbers[-2] + @numbers[-1]; @numbers.pop
		# can be applied to all other methods below
	end


	def minus
		raise_error if @numbers.length <= 1 
		@numbers[-2] = @numbers[-2] - @numbers[-1]
		@numbers.pop
	end

	def times
		raise_error if @numbers.length <= 1 
		@numbers[-2] = @numbers[-2] * @numbers[-1]
		@numbers.pop
	end

	def divide
		raise_error if @numbers.length <= 1 
		@numbers[-2] = @numbers[-2].to_f / @numbers[-1]
		@numbers.pop
	end

	def raise_error  
	  raise "calculator is empty"   
	end  

	def tokens(string) # returns array
		string.split(" ").map {|elem| elem =~ /[\+\-\*\/]/ ? elem.to_sym : elem.to_i }
	end

	def evaluate(string)
		tokens(string).each do |elem| 
			case elem
			when :+ then plus
			when :- then minus
			when :* then times
			when :/ then divide
			else push(elem)
			end
		end
		value
	end

end