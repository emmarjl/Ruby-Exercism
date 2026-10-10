class Cipher
  attr_reader :key

  def initialize(key = nil)
    @key = key || generate_key

    unless @key.match?(/\A[a-z]+\z/)
      raise ArgumentError
    end
  end

  def encode(plaintext)
    transform(plaintext, :+)
  end

  def decode(ciphertext)
    transform(ciphertext, :-)
  end

  private

  def generate_key
    Array.new(100) { ('a'..'z').to_a.sample }.join
  end

  def transform(text, operation)
    text.chars.each_with_index.map do |char, index|
      shift = @key[index % @key.length].ord - 'a'.ord
      base = char.ord - 'a'.ord

      value =
        if operation == :+
          (base + shift) % 26
        else
          (base - shift) % 26
        end

      (value + 'a'.ord).chr
    end.join
  end
end