# Author: Vlad Burca
# Date: 26 Jan 2013
# File: beautiful_strings.rb
# Problem: Beautiful Strings
# Description: Facebook Hacker Cup 2013 - Qualification Round

m = Integer(gets.chomp)

i = 1

alphabet = ('a'..'z').to_a.join
# puts "#{alphabet}"

while i <= m
	str = gets.chomp
	beauty = Array.new(26, 0)
	value = 26

	# puts "beauty = #{beauty}"

	str.downcase.each_char do |chr|
		# print "#{chr}"
		# STDOUT.flush

		if alphabet.include? chr
			beauty[chr.ord - 'a'.ord] += 1
		end
	end
	beauty = beauty.sort { |x, y| y <=> x }
	# puts "#{beauty}"

	beauty_value = 0
	beauty.each do |b_value|
		break if b_value == 0
		beauty_value += value * b_value
		value -= 1
	end
	puts "Case \##{i}: #{beauty_value}"
	i += 1
end