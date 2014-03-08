def reverser
	yield.split(' ').map(&:reverse).join(' ')
end

def adder int = 1
	yield + int
end

def repeater int = 1
	int.times { yield }
end

