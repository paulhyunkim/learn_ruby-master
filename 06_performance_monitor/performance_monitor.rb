def measure int = 1
	start_time = Time.now
	int.times { yield }
	total_time = (Time.now - start_time) / int
end
