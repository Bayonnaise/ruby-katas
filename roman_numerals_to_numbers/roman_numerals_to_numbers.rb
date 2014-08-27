NUMERALS = {
	'I' => 1,
	'IV' => 4,
	'V' => 5,
	'IX' => 9,
	'X' => 10,
	'XL' => 40,
	'L' => 50,
	'XC' => 90,
	'C' => 100,
	'CD' => 400,
	'D' => 500,
	'CM' => 900,
	'M' => 1000
}

def roman_numeral_to_number(numeral)
	solution = 0

	(0..numeral.size).each do |index|
		NUMERALS.reverse_each do |roman, arabic|
			if numeral[index+1] && numeral[index] + numeral[index+1] == roman
				solution += arabic
				numeral.slice!(index, 2)
			elsif numeral[index] == roman
				solution += arabic
			end
		end
	end

	solution
end