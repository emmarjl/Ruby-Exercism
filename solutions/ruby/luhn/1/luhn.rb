=begin
Write your code for the 'Luhn' exercise in this file. Make the tests in
`luhn_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/luhn` directory.
=end

class Luhn
  def self.valid?(number)
    number = number.delete(' ')

    return false if number.length <= 1
    return false unless number.match?(/\A\d+\z/)

    digits = number.chars.map(&:to_i)
    sum = 0

    digits.reverse.each_with_index do |digit, index|
      if index.odd?
        digit *= 2
        digit -= 9 if digit > 9
      end

      sum += digit
    end

    sum % 10 == 0
  end
end