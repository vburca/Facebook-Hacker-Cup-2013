# Author: Vlad Burca
# Date: 27 Jan 2013
# File: find_the_min.rb
# Problem: Find the Min
# Description: Facebook Hacker Cup 2013 - Qualification Round

T = gets.chomp.to_i

i = 1

while i <= T
	line = gets.chomp
	line = line.split

	n = line[0].to_i
	k = line[1].to_i

	line = gets.chomp
	line = line.split

	a = line[0].to_i
	b = line[1].to_i
	c = line[2].to_i
	r = line[3].to_i

	puts "Case ##{i}: n= #{n}, k= #{k}, a= #{a}, b= #{b}, c= #{c}, r= #{r}"

	i += 1
end
