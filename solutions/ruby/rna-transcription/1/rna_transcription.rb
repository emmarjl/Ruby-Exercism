class Complement
  TRANSCRIPTION = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }.freeze

  def self.of_dna(dna)
    dna.chars.map { |nucleotide| TRANSCRIPTION[nucleotide] }.join
  end
end