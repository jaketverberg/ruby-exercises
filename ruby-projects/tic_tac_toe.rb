module TicTacToe
    WINNING_POSITIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

    class Game
      def initialize(player_1, player_2)
        @board = Array.new(10)

        puts "This TicTacToe Game requires 2 players"
        puts "What is the first players name?"
        player_name_1 = gets.chomp
        puts "What is the second players name?"
        player_name_2 = gets.chomp


        @current_player_id = 0
        @players = [player_1.new(self, "X", player_name_1), player_2.new(self, "O", player_name_2)]

        puts "#{current_player.name} goes first."
      end
      attr_reader :board, :current_player_id

      def play
        loop do
          place_player_marker(current_player)

          if player_has_won?(current_player)
            puts "#{current_player.name} wins! Good work!"
            print_board
            return
          elsif board_full?
            puts "Draw! Way to defend your positions."
            print_board
            return
          end

          switch_players!
        end
      end

      def free_positions
        (1..9).select { |position| @board[position].nil? }
      end

      def place_player_marker(player)
          position = player.select_position!
          puts "#{player.name} selects #{player.marker} position #{position}"
          @board[position] = player.marker
      end

      def player_has_won?(player)
        WINNING_POSITIONS.any? do |line|
          line.all? { |position| @board[position] == player.marker }
        end
      end

      def board_full?
        free_positions.empty?
      end

      def other_player_id
        1 - @current_player_id
      end

      def switch_players!
        @current_player_id = other_player_id
      end

      def current_player
        @players[current_player_id]
      end

      def opponent
        @players[other_player_id]
      end

      def turn_num
        10 - free_positions.size
      end

      def print_board
        col_separator = ' | '
        row_separator = '--+---+--'

        label_for_position = lambda{ |position| @board[position] ? @board[position] : position }

        row_for_display = lambda{ |row| row.map(&label_for_position).join(col_separator) }
        row_positions = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
        rows_for_display = row_positions.map(&row_for_display)
        puts rows_for_display.join("\n" + row_separator + "\n")
      end
    end

    class Player
      def initialize(game, marker, name)
        @game = game
        @marker = marker
        @name = name
      end

      def select_position!
        @game.print_board
        loop do
          print "#{name} - select your #{marker} position: "
          selection = gets.to_i
          return selection if @game.free_positions.include?(selection)
          puts "Position #{selection} is already taken. Try again."
        end
      end

      attr_reader :marker
      attr_reader :name
    end
  end

  include TicTacToe

  Game.new(Player, Player).play