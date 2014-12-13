require_relative "aditya_tic_tac_toe/board.rb"
require_relative "aditya_tic_tac_toe/player"
require_relative "aditya_tic_tac_toe/cursor"
require_relative "aditya_tic_tac_toe/rules"
require_relative "aditya_tic_tac_toe/tui"

class AdityaTicTacToe
  
  def initialize(size = 3, number_of_players = 2, goal = 3)
    @board   = AdityaTicTacToe::Board.new(size)
    @players = AdityaTicTacToe::PlayerList.new(number_of_players)
    @cursor  = AdityaTicTacToe::Cursor.new(@board)
    @rules   = AdityaTicTacToe::Rules.new(goal)
  end

  def start
    @tui = AdityaTicTacToe::TUI.new
    setup

    @tui.listen do |key|
      handle_keypress(key) unless game_over?
    end
  end

  private

  def setup
    @tui.board!(@board.to_s)
    @tui.cursor!(@cursor.field)
    @tui.status!(@players.to_a, @players.current)
  end

  def handle_keypress(key)
    case key
    when :UP, :DOWN, :RIGHT, :LEFT
      move(key.downcase)
    when "h", "j", "k", "l"
      direction = {"h" => :left, "j" => :down, "k" => :up, "l" => :right}[key]
      move(direction)
    when " "
      mark
      if game_over?
        @tui.cursor!(@cursor.field, hidden: true)
        @tui.status!(@players.to_a)
      end
    when :RESIZE
      @tui.clear
      setup
    end
  end

  def move(direction)
    @cursor = @cursor.move(direction)
    @tui.cursor!(@cursor.field)
  end

  def mark
    return if @board.marked?(@cursor.field)

    @board = @board.mark(@cursor.field, @players.current.symbol)
    @tui.board!(@board.to_s)

    @players.next!
    @tui.status!(@players.to_a, @players.current)
  end

  def game_over?
    @rules.game_over?(@board, @players)
  end
end