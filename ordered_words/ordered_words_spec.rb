require_relative './ordered_words'

describe 'order words checker' do
  
  it 'is true for words with letters appearing in alphabetical order' do
    expect(ordered?('a')).to be true
    expect(ordered?('forty')).to be true
    expect(ordered?('CHIMPS')).to be true
  end

  it 'is false for words with letters not appearing in alphabetical order' do
    expect(ordered?('tomato')).to be false
    expect(ordered?('bA')).to be false
  end

end