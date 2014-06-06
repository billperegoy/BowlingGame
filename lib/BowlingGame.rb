class BowlingGame
  attr_reader :score

  def initialize
    @score = 0
    @frame = 1
    @frame_score = 0
    @frame_roll = 0

    @strike_add = 0
    @spare_add = false
  end

  def roll(pins)
    @score += pins
    if @spare_add
      @score += pins
      @spare_add = false
    end
    if @strike_add > 0
      @score += pins
      @strike_add -= 1
    end
    @frame_score += pins
    @frame_roll += 1 

    check_for_end_of_frame
  end


  private
  def strike?
    (@frame_roll == 1) && (@frame_score == 10)
  end

  def spare?
    (@frame_roll == 2) && (@frame_score == 10)
  end

  def frame_complete?
    @frame_roll == 2
  end

  def check_for_end_of_frame
    if strike?
      @strike_add += 2
      finish_frame
    elsif spare?
      @spare_add = true
      finish_frame
    elsif frame_complete?
      finish_frame
    end
  end

  def finish_frame
    @frame += 1
    @frame_score = 0
    @frame_roll = 0
  end
end
