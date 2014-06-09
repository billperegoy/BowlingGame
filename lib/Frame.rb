# Class that implments logic to keep track of a single bowling
# frame. Note that there is the concept of non-scoring frames.
# These allow the use of the frame concept for the extra balls
# rolled after sapares or frames in the final two frames.
#
class Frame
  def initialize(frame_num)
    @scoring_frame = (frame_num >= 1) && (frame_num <=10)
    @score = 0
    @bonus_score = 0
    @roll = 0
  end

  def scoring_frame?
    @scoring_frame
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

  def first_roll?
    @roll == 1
  end

  def add_roll(pins)
    @score += pins
    @roll += 1
  end

  def add_to_bonus_score(pins)
    @bonus_score += pins
  end
end
