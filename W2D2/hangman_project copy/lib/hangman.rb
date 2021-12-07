class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def self.random_word
    DICTIONARY.sample
  end 

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index do |secret, i|
      indices << i if char == secret
    end 
  indices
  end

  def fill_indices(char, arr)
    arr.each do |i|
      @guess_word[i] = char
    end 
  end

  def try_guess(char)
    
    if self.already_attempted?(char)
      print 'that has already been attempted'
      return false
    else
      if self.get_matching_indices(char).empty?
        @remaining_incorrect_guesses -= 1
      else
        self.fill_indices(char, self.get_matching_indices(char))
      end 
        @attempted_chars << char
        return true
    end  
     
  end

  def ask_user_for_guess
    print 'Enter a char:'
    input = gets.chomp
    self.try_guess(input)
  end

  def win?
    if @guess_word.join == @secret_word
      p 'WIN'
      return true
    else
      return false
    end 
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      print 'LOSE'
      return true
    else
      return false
    end 
  end

  def game_over?
    if self.win? || self.lose?
      print @secret_word
      return true
    else
      return false
    end 
  end
end
