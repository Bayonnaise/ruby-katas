COINS = [
	[200, '£2'],
	[100, '£1'],
	[50, '50p'],
	[20, '20p'],
	[10, '10p'],
	[5, '5p'], 
	[2, '2p'],
	[1, '1p']
]

def money_to_coins(amount)
	output = ""

	remaining = amount.gsub(/[p]/, '').to_i if amount.chars.last == 'p'
	remaining = (amount.gsub(/[£]/, '').to_f * 100).to_i if amount.chars.first == '£'

	COINS.each do |coin_value, coin_string|
		next if remaining < coin_value

		coin_quantity = remaining / coin_value
		remaining = remaining % coin_value

		output.prepend("#{coin_quantity}x#{coin_string}") unless coin_quantity == 0
		output.prepend(" ") unless remaining == 0
	end 

	output
end