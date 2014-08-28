require_relative './number_to_words'

describe 'numbers to words' do

  context "for a single digit integer" do
    it "converts one digit strings into a word representation" do
      expected = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
      expect((1..9).map { |i| number_to_words(i) }).to eq expected
    end

    it "handles zero appropriately" do
      expect(number_to_words(0)).to eq ""
    end
  end

  context "for a two digit number" do
    it "returns a word representation" do
      expected = ["twenty four",
                  "forty five",
                  "seventy eight"]
      expect([24, 45, 78].map { |i| number_to_words(i) }).to eq expected
    end

    it "handles zeros appropriately" do
      expect(number_to_words(20)).to eq "twenty"
    end

    it "handles teens appropriately" do
      expected = ["ten","eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen"]
      expect((10..19).map { |i| number_to_words(i) }).to eq expected
    end
  end

  context "for a three digit integer" do
    it "returns a word representation" do
      expected = ["one hundred and twenty three",
                  "four hundred and fifty six",
                  "seven hundred and eighty nine",
                  "one hundred and twelve",]
      expect([123, 456, 789, 112].map { |i| number_to_words(i) }).to eq expected
    end

    it "handles zeros appropriately" do
      expected = ["one hundred and three",
                  "seven hundred and eighty",
                  "one hundred"]
      expect([103, 780, 100].map { |i| number_to_words(i) }).to eq expected
    end
  end

  context "for integers with four or more digits" do
    it "returns a word representation" do
      expected =
      ["four hundred and seventeen thousand one hundred and fifty four",
      "four hundred and seventeen thousand one hundred and fifty five",
      "nine hundred and eight thousand and seventy",
      "nine hundred and ninety nine thousand nine hundred and ninety nine",
      "one million",
      "one million one hundred"]
      test_numbers = [417154,417155,908070,999999,1000000,1000100]
      expect(test_numbers.map { |i| number_to_words(i) }).to eq expected
    end
  end

  it 'accurately converts the first 10 thousand numbers' do
    fixture_path = File.dirname(__FILE__) + '/first_10k.txt'
    expected = IO.read(fixture_path).split("\n")

    (1..10000).each do |n|
      expect(number_to_words(n)).to eq expected[n-1]
    end
  end 
  
end