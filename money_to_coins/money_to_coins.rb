def money_to_coins(amount)
	output = ""

	if amount.chars.last == 'p'
		amount = amount.gsub(/[p]/, '').to_i
	elsif amount.chars.first == '£'
		amount = (amount.gsub(/[£]/, '').to_f * 100).to_i
	end

	[[200, '£2'], [100, '£1'], [50, '50p'], [20, '20p'], [10, '10p'], [5, '5p'], [2, '2p'], [1, '1p']].each do |coin, string|
		next if amount < coin

		word = amount / coin
		amount = amount % coin

		output.prepend("#{word}x#{string}") unless word == 0
		output.prepend(" ") unless amount == 0
	end 

	output
end