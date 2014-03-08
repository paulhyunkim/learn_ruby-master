def add(a,b)
	a + b
end

def subtract(a,b)
	a - b
end

def sum(array)
	sum = 0
	array.each { |x| sum += x}
	sum
	# or array.inject(0, :+)
end

# def multiply(*args)
#	args.inject(1, :*)
# end

def #power(a,b)
	a ** b
end 