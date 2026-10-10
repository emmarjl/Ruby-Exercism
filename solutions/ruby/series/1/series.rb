=begin
Write your code for the 'Series' exercise in this file. Make the tests in
`series_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/series` directory.
=end

class Series
  def initialize(digits)
    raise ArgumentError if digits.empty?

    @digits = digits
  end

  def slices(n)
    raise ArgumentError if n > @digits.length

    @digits.chars.each_cons(n).map(&:join)
  end
end