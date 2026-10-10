class Pangram
  ALPHABET = ('a'..'z').to_a.freeze

  def self.pangram?(sentence)
    letters = sentence.downcase.scan(/[a-z]/).uniq
    (ALPHABET - letters).empty?
  end
end