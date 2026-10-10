class Tournament
  HEADER = "Team                           | MP |  W |  D |  L |  P\n"

  def self.tally(input)
    teams = Hash.new do |hash, team|
      hash[team] = { mp: 0, w: 0, d: 0, l: 0, p: 0 }
    end

    input.each_line(chomp: true) do |line|
      next if line.empty?

      team1, team2, result = line.split(";")

      teams[team1][:mp] += 1
      teams[team2][:mp] += 1

      case result
      when "win"
        teams[team1][:w] += 1
        teams[team1][:p] += 3

        teams[team2][:l] += 1
      when "loss"
        teams[team1][:l] += 1

        teams[team2][:w] += 1
        teams[team2][:p] += 3
      when "draw"
        teams[team1][:d] += 1
        teams[team1][:p] += 1

        teams[team2][:d] += 1
        teams[team2][:p] += 1
      end
    end

    rows = teams
      .sort_by { |team, stats| [-stats[:p], team] }
      .map do |team, stats|
        format(
          "%-31s| %2d | %2d | %2d | %2d | %2d",
          team,
          stats[:mp],
          stats[:w],
          stats[:d],
          stats[:l],
          stats[:p]
        )
      end

    HEADER + rows.join("\n") + (rows.empty? ? "" : "\n")
  end
end