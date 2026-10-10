module Blackjack
  def self.parse_card(card)
    case card
    when "ace" then 11
    when "two" then 2
    when "three" then 3
    when "four" then 4
    when "five" then 5
    when "six" then 6
    when "seven" then 7
    when "eight" then 8
    when "nine" then 9
    when "ten" then 10
    when "jack" then 10
    when "queen" then 10
    when "king" then 10
    when "other" then 0
    else 0
    end
  end

  def self.card_range(card1, card2)
    total = parse_card(card1) + parse_card(card2)

    case total
    when 4..11
      "low"
    when 12..16
      "mid"
    when 17..20
      "high"
    when 21
      "blackjack"
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    player_total = parse_card(card1) + parse_card(card2)
    dealer_value = parse_card(dealer_card)

    if card1 == "ace" && card2 == "ace"
      return "P"
    end

    if player_total == 21
      if ["ace", "ten", "jack", "queen", "king"].include?(dealer_card)
        return "S"
      else
        return "W"
      end
    end

    if player_total.between?(17, 20)
      return "S"
    end

    if player_total.between?(12, 16)
      if dealer_value >= 7
        return "H"
      else
        return "S"
      end
    end

    if player_total <= 11
      return "H"
    end
  end
end
