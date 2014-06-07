class Frame
  attr_reader :score

  def initialize
    @score = 0
    @roll = 0
  end

  def strike?
    (@roll == 1) && (@score == 10)
  end
  
  def spare?
    (@roll == 2) && (@score == 10)
  end

  def complete?
    @roll == 2
  end

  def add_to_score(pins)
    @score += pins
  end

  def next_roll
    @roll += 1
  end
end
