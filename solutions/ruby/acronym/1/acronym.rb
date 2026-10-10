class Acronym
  def self.abbreviate(phrase)
    cleaned = phrase.gsub(/[^a-zA-Z\- ]/, "")
    words = cleaned.split(/[\s\-]+/)
    words.map { |w| w[0].upcase }.join
  end
end
