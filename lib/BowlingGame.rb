class BowlingGame
  def initialize
    @score = 0
    @frame = 1
    @frame_score = 0
    @frame_roll = 0
    @spare_add = false
  end

  def roll(pins)
    @score += pins
    if @spare_add
      @score += pins
      @spare_add = false
    end
    @frame_score += pins
    @frame_roll += 1

    if strike
    elsif spare
      @spare_add = true
    elsif frame_complete
    end
  end


  def score
    @score
  end

  private
  def strike
    (@frame_roll == 1) && (@frame_score == 10)
  end

  def spare
    (@frame_roll == 2) && (@frame_score == 10)
  end

  def frame_complete
    @frame_roll == 2
  end
end
