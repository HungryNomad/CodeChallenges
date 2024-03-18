class Tournament
  def initialize; end

  def self.tally(input)
    matches = matchify(input)
    tournament = tally_matches(matches)
    generate_output(tournament)
  end

  Match = Struct.new(:team1, :team2, :outcome)
  def self.matchify(input)
    entries = input.split("\n").map { |line| line.split(';') }
    return if entries.empty?

    entries.map { |match| Match.new(*match) }
  end

  Tally = Struct.new(:matches_played, :wins, :draws, :losses, :points)
  def self.tally_matches(matches)
    tournament = {}

    return [] if matches.nil?

    matches.each do |match|
      # Init teams
      team1 = match.team1
      team2 = match.team2
      tournament[team1] ||= Tally.new(0, 0, 0, 0, 0)
      tournament[team2] ||= Tally.new(0, 0, 0, 0, 0)

      if match.outcome == 'win'
        tournament[team1].matches_played += 1
        tournament[team1].wins += 1
        tournament[team1].points += 3

        tournament[team2].matches_played += 1
        tournament[team2].losses += 1
      end
      if match.outcome == 'loss'
        tournament[team2].matches_played += 1
        tournament[team2].wins += 1
        tournament[team2].points += 3

        tournament[team1].matches_played += 1
        tournament[team1].losses += 1

      end

      next unless match.outcome == 'draw'

      tournament[team1].matches_played += 1
      tournament[team1].draws += 1
      tournament[team1].points += 1

      tournament[team2].matches_played += 1
      tournament[team2].draws += 1
      tournament[team2].points += 1
    end
    puts tournament

    tournament
  end

  def self.generate_output(tournament)
    header = %w[Team MP W D L P]
    header_cells = [header[0].ljust(30), *(header[1..].map { |item| item.rjust(2) })]


    output = ''
    [header, *tournament.map].each do |line|
      # Team is cell is 30 characters and ljust, the other cells are 2 characters and rjust
      cells = [line[0].ljust(30), *(line[1..].map { |item| item.rjust(2) })]
      # Debug
      puts cells
      output += cells.join(' | ').strip
      output += "\n"
    end
    output
  end

  def self.sort_tournament(tournament); end
end
