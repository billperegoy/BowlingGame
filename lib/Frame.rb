class Frame
  attr_reader :roll 

  def initialize
    @score = 0
    @bonus_score = 0
    @roll = 0
  end

  def score
    @score + @bonus_score
  end

  def strike?
    (@roll == 1) && (@score == 10)
  end
 
  def spare?
    (@roll == 2) && (@score == 10)
  end

  def no_mark?
    (@roll == 2) && (@score < 10)
  end

  def complete?
    strike? || spare? || no_mark?
  end

  def add_to_score(pins)
    @score += pins
    @roll += 1
  end

  def add_to_bonus_score(pins)
    @bonus_score += pins
  end
end
