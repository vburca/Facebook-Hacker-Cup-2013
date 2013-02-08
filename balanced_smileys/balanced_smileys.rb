# Author: Vlad Burca
# Date: 26 Jan 2013
# File: balanced_smileys.rb
# Problem: Balanced Smileys
# Description: Facebook Hacker Cup 2013 - Qualification Round
	

def walk(_str, _index, _new_stack)
	#$ID += 1
	smiley = false
	illegal = false
	_stack = Array.new(_new_stack)
	# puts "[#{$ID}] " + _str + " + " + _stack.join
	prev = ''
	len = _str.length

	_str.each_char do |chr|
		# found illegal char
		if !$valid_chars.include? chr
			# balanced = NO
			illegal = true
			break
		end

		# watch for smiley at next interation
		if chr == ':'
			smiley = true
			prev = chr
			_index += 1
			next
		end

		# found possible smiley
		if (chr == '(' or chr == ')') and smiley == true
			if _index <= len
				#puts "index: #{_index}"
				_new_index = 0
				# puts "[#{$ID}] " + "pass _stack: #{_stack.join}"
				walk(_str[_index, len], _new_index, _stack)
			end
			# continue on this side with treating it as smiley
			smiley = false
			_index += 1
			next
			# end
		end

		# found regular ( paranthesis
		if chr == '('
			_stack.push(chr)
			# puts "[#{$ID}] " + "push(#{_index})_stack: #{_stack.join}"
			_index += 1
			next
		end

		# found regular ) paranthesis
		if chr == ')'
			# if there is an ( paranthesis
			if _stack.size > 0
				_stack.pop
				# puts "[#{$ID}] " + "pop(#{_index})_stack: #{_stack.join}"
				_index += 1
				next
			else
				# unbalanced paranthesis
				illegal = true
				break
			end
		end

		# other char after : -> reset smiley flag
		if smiley == true
			smiley = false
			_index += 1
			next
		end

		# any other char
		_index += 1
		next
	end

	# check to see how we finished traversing the string
	if (_stack.size > 0 or illegal == true) and $balanced != YES
		$balanced = NO
	elsif illegal == false
		$balanced = YES
	end
end


# main

#$ID = 0

T = Integer(gets.chomp)

YES = "YES"
NO = "NO"

i = 1

$valid_chars = ('a'..'z').to_a.push(' :()').join

while i <= T
	str = gets.chomp

	$balanced = NO

	stack = Array.new()
	prev = ''

	walk(str, 0, stack)

	case $balanced
	when YES then puts "Case ##{i}: #{YES}"
	when NO then puts "Case ##{i}: #{NO}"
	end

	i += 1
end