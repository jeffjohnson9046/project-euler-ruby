# The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:
#
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
#
# Let us list the factors of the first seven triangle numbers:
#
#  1: 1
#  3: 1,3
#  6: 1,2,3,6
# 10: 1,2,5,10
# 15: 1,3,5,15
# 21: 1,3,7,21
# 28: 1,2,4,7,14,28
# We can see that 28 is the first triangle number to have over five divisors.
#
# What is the value of the first triangle number to have over five hundred divisors?
###############################################################################
start_time = Time.now

# Get all the divisors for a given number.  Use "flatten" to create a one-dimensional array
# of all the results.  Use "compact" to remove any "nil" results.
# TEST = puts "all divisors for 28 = #{divisors(28)}"
# LARGE NUMBER TEST = puts "number of divisors for 10,000,000,000 = #{divisors(10000000000).length}"
def divisors(value)
	(1..Math.sqrt(value).floor).collect { |i| [i, value/i] if ((value/i) * i) == value }.flatten.compact
end

# Triangle numbers enumerator
# TEST = puts "first 7 triangle numbers: #{triangle_numbers.take(7)}" # => [1, 3, 6, 10, 15, 21, 28]
triangle_numbers = Enumerator.new do |i|
	t = 0 # the current triangle number
	c = 1 # the number of times we've iterated; the "triangle part" ()

	loop do
		t += c # get the next triangle number
		c += 1 # increment the count
		i.yield t # yield the result
	end
end

# SOLVE
result = 0

triangle_numbers.each do |i|
	if divisors(i).length >= 500
		result = i
		break
	end
end

puts "answer = #{result}"
puts "elapsed time = #{Time.now - start_time} seconds."