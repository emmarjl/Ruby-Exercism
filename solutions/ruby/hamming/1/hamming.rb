=begin
Write your code for the 'Hamming' exercise in this file. Make the tests in
`hamming_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/hamming` directory.
=end

class Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError if strand1.length != strand2.length

    distance = 0

    strand1.chars.each_with_index do |char, index|
      distance += 1 if char != strand2[index]
    end

    distance
  end
end