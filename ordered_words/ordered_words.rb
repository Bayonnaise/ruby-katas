def ordered?(word)
	word.chars.uniq == word.chars.sort
end