class Game
  class BowlingError < StandardError
  end

  def initialize
    @rolls = []
    @frame = 1
    @rolls_in_frame = 0
    @first_roll = nil
  end

  def roll(pins)
    raise BowlingError if pins < 0 || pins > 10
    raise BowlingError if @frame > 10

    if @frame < 10
      roll_normal_frame(pins)
    else
      roll_tenth_frame(pins)
    end

    @rolls << pins
  end

  def score
    raise BowlingError unless game_complete?

    total = 0
    roll = 0

    10.times do
      if @rolls[roll] == 10
        total += 10 + @rolls[roll + 1] + @rolls[roll + 2]
        roll += 1
      elsif @rolls[roll] + @rolls[roll + 1] == 10
        total += 10 + @rolls[roll + 2]
        roll += 2
      else
        total += @rolls[roll] + @rolls[roll + 1]
        roll += 2
      end
    end

    total
  end

  private

  def roll_normal_frame(pins)
    if @rolls_in_frame == 0
      @first_roll = pins
      @rolls_in_frame = 1

      if pins == 10
        @frame += 1
        @rolls_in_frame = 0
        @first_roll = nil
      end
    else
      raise BowlingError if @first_roll + pins > 10

      @frame += 1
      @rolls_in_frame = 0
      @first_roll = nil
    end
  end

  def roll_tenth_frame(pins)
    if @rolls_in_frame == 0
      @first_roll = pins
      @rolls_in_frame = 1

    elsif @rolls_in_frame == 1
      if @first_roll == 10 || @first_roll + pins == 10
        @rolls_in_frame = 2
      else
        @frame = 11
      end

      if @first_roll < 10 && @first_roll + pins > 10
        raise BowlingError
      end

    elsif @rolls_in_frame == 2
      second_roll = @rolls[-1]

      if @first_roll == 10
        if second_roll < 10 && second_roll + pins > 10
          raise BowlingError
        end
      elsif @first_roll + second_roll == 10
        # Spare gets one bonus roll.
      else
        raise BowlingError
      end

      @frame = 11
    end
  end

  def game_complete?
    frame = 1
    roll = 0

    while frame < 10
      return false if roll >= @rolls.length

      if @rolls[roll] == 10
        roll += 1
      else
        return false if roll + 1 >= @rolls.length
        roll += 2
      end

      frame += 1
    end

    return false if roll >= @rolls.length

    first = @rolls[roll]

    if first == 10
      @rolls.length >= roll + 3
    elsif roll + 1 >= @rolls.length
      false
    elsif first + @rolls[roll + 1] == 10
      @rolls.length >= roll + 3
    else
      @rolls.length >= roll + 2
    end
  end
end
