class Game

  RULES = [
    { moves: [:rock, :scissors], winner: :player_1},
    { moves: [:scissors, :rock], winner: :player_2},
    { moves: [:rock, :paper], winner: :player_2},
    { moves: [:paper, :rock], winner: :player_1},
    { moves: [:paper, :scissors], winner: :player_2},
    { moves: [:scissors, :paper], winner: :player_1}
  ]

  def self.create(player_1, player_2)
    @current_game = self.new(player_1, player_2)
  end

  def self.instance
    @current_game
  end

  attr_reader :player_1, :player_2

  def initialize(player_1, player_2, rules = RULES)
    @player_1 = player_1
    @player_2 = player_2
    @rules = rules
  end

  def play
    @moves = [player_1.move, player_2.move]
    get_result
    winner
  end

  def winner
    return if result.empty?
    @winner = result.first[:winner] == :player_1 ? player_1 : player_2
  end

  private
  attr_reader :moves, :rules, :result

  def get_result
    @result = rules.select { |rule| rule[:moves] == moves }
  end
end
