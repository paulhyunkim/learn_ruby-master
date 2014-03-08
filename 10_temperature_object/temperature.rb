class Temperature

	def initialize opts = {}
		@options = opts
	end

	def in_fahrenheit
		@options[:f] ? @options[:f] : @options[:c] * (9.0/5) + 32
	end

	def in_celsius
		@options[:c] ? @options[:c] : (@options[:f] - 32) * (5.0/9)
	end

	def self.from_celsius(c)
    new(:c => c)
  end

  def self.from_fahrenheit(f)
    new(:f => f)
  end

end

class Celsius < Temperature

	def initialize c
		super(:c => c)
	end

end

class Fahrenheit < Temperature

	def initialize f
		super(:f => f)
	end

end

