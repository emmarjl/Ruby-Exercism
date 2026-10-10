class Isogram
  def self.isogram?(phrase)
    letters = phrase.downcase.gsub(/[^a-z]/, "").chars
    letters.uniq.length == letters.length
  end
end