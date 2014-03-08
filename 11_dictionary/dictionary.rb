class Dictionary
	attr_accessor :entries 
	
	def initialize
		@entries = {}
	end

	def add entry
		entry.is_a?(Hash) ? @entries.merge!(entry) : @entries[entry] = nil
	end

	def keywords
    @entries.keys.sort
  end

  def include? keyword
  	@entries.keys.include?(keyword)
  end

  def find word
  	@entries.select {|k,v| k.start_with?(word)}
  end

  def printable
  	output = "rak"
  	@entries.sort.each {|k,v| output << "[#{k}] \"#{v}\"\n"}
  	output.chop
  end

end