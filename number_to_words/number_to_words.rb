ONES = {
	0 => '',
	1 => 'one',
	2 => 'two',
	3 => 'three',
	4 => 'four',
	5 => 'five',
	6 => 'six',
	7 => 'seven',
	8 => 'eight',
	9 => 'nine'
}

TEENS = {
	1 => 'eleven',
	2 => 'twelve',
	3 => 'thirteen',
	4 => 'fourteen',
	5 => 'fifteen',
	6 => 'sixteen',
	7 => 'seventeen',
	8 => 'eighteen',
	9 => 'nineteen'
}

TENS = {
	1 => 'ten',
	2 => 'twenty',
	3 => 'thirty',
	4 => 'forty',
	5 => 'fifty',
	6 => 'sixty',
	7 => 'seventy',
	8 => 'eighty',
	9 => 'ninety'
}

def number_to_words(number)
	output = ""
	needs_and = true

  [[1_000_000, 'million'], [1000, 'thousand'], [100, 'hundred'], [10, ''], [1, '']].each do |group, string|
    next if number < group

    word = number / group
    number = number % group

    if group == 10
    	output << "and " unless output.empty?
      if word == 1 && number != 0
        output << TEENS[number]
        break
      else
        output << TENS[word]
        needs_and = false
      end
    elsif group == 1
    	output << "and " if output.size > 0 && needs_and
      output << ONES[word]
    else          
      output << "#{number_to_words(word)} #{string}" unless word == 0
    end

    output << " " unless number == 0
  end

  output
end