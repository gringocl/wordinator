require 'minitest/autorun'

class Anagram
  def check_if_anagram(word, check)
    if word.downcase.chars != check.downcase.chars
      result = (word.downcase.chars.sort == check.downcase.chars.sort)
      return {result: result, word: word, check: check}
    else
      return "Please enter a valid string"
    end
  end
end

describe "test words to be anagrams" do
  it "returns true when two words are anangrams" do
    anagram = Anagram.new
    word = "string"
    check = "string"
    result = anagram.check_if_anagram(word, check)
    result[:result].must_equal true
  end

  it "returns false when two words are not anagrams" do
    anagram = Anagram.new
    word = "string"
    check = "string_other"
    result = anagram.check_if_anagram(word, check)
    result[:result].must_equal false
  end

  it "returns true when different cases are used" do
    anagram = Anagram.new
    word = "STRING"
    check = "string"
    result = anagram.check_if_anagram(word, check)
    result[:result].must_equal true
  end

  it "returns an error when strings are used as inputs" do
    anagram = Anagram.new
    word = "string"
    check = 1
    anagram.check_if_anagram(word, check).must_equal "Please enter a valid string"
  end
end
