NUMERALS = {
	1 => 'I',
	4 => 'IV',
	5 => 'V',
	9 => 'IX',
	10 => 'X',
	40 => 'XL',
	50 => 'L',
	90 => 'XC',
	100 => 'C',
	400 => 'CD',
	500 => 'D',
	900 => 'CM',
	1000 => 'M'
}

def number_to_roman_numeral(n)
	solution = ""

	NUMERALS.reverse_each do |arabic, roman|
		while n >= arabic
			solution += roman
			n -= arabic
		end
	end

	solution += ('I' * n)
end
