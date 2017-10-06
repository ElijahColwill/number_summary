def mean(array)
	sum = 0
	array.each do |num|
		sum += num
	end
	return sum / array.length
end

def median(array)
	sorted = array.sort
	if sorted.length % 2 == 1
		return sorted[(sorted.length / 2)]
	end
	return (sorted[sorted.length / 2] + sorted[(sorted.length / 2) - 1]) / 2.0 
end

def mode(array)
	most_num = [array[0]]
	numbers = []
	counter = []
	array.each_with_index do |num, i|
		index_of_num = 0
		if numbers.include? num
			numbers.each_with_index do |num2, i2|
				if num2 == num
					index_of_num = i2
				end
			end
			counter[index_of_num] = counter[index_of_num] + 1
		else
			numbers.push(num)
			counter.push(1)
		end
	end
	max = counter[0]
	counter.each_with_index do |num, i|
		if num > max
			max = num
		end
	end
	puts max
	puts "--"
	puts counter
	puts "--"
	puts numbers
	puts "--"
	counter.each_with_index do |num, i|
		if most_num.length > 0
			if numbers[i] != most_num[i]
				if max == num
					most_num.push(numbers[i])
				end
			end
		else
			if max == num
				most_num.push(numbers[i])
			end
		end
	end
	return most_num
end

puts mode([1, 2, 2, 2, 3, 3, 4, 1])