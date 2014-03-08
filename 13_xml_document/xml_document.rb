class XmlDocument
	attr_accessor :indent, :indent_level

	def initialize(indent = false)
		@indent = indent
		@indent_level = 0
	end

	def method_missing(method_name, hash = {}, &block)
		tag = ""
		tag << ("  " * @indent_level) if @indent
		tag << "<#{method_name}"
		hash.each_pair {|k,v| tag << " #{k}='#{v}'"}	
		if block
			tag << ">"
			tag << "\n" if @indent
			@indent_level += 1
			tag << yield
			@indent_level -= 1
			tag << ("  " * @indent_level) if @indent
			tag << "</#{method_name}>"
			tag << "\n" if @indent
		else 
			tag << "/>"
			tag << "\n" if @indent
		end
		tag
	end

end

=begin
class XmlDocument
  def initialize(indent = false)
    @indent = indent
    @indent_level = 0
  end

  def method_missing(method_name, *args, &block)
    attributes = args[0] || {}
    s = ""
    s << ("  " * @indent_level) if @indent
    s << "<#{method_name}"
    attributes.each_pair do |key, value|
      s << " #{key}='#{value}'"
    end
    if block
      s << ">"
      s << "\n" if @indent
      @indent_level += 1
      s << yield
      @indent_level -= 1
      s << ("  " * @indent_level) if @indent
      s << "</#{method_name}>"
      s << "\n" if @indent

    else
      s << "/>"
      s << "\n" if @indent
    end
    s
  end
end
=end