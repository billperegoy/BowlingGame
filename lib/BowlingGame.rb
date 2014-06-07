class BowlingGame

  def initialize
    @frames = (1..10).map { |f|  Frame.new }
    @frame_number = 0
    @strike_add = 0
    @spare_add = false
  end

  def score
    @frames.inject(0) { |result, elem| result + elem.score }
  end

  def roll(pins)
    current_frame.add_to_score(pins)
    if @spare_add
      previous_frame.add_to_score(pins)
      @spare_add = false
    end
    if @strike_add > 0
      previous_frame.add_to_score(pins)
      @strike_add -= 1
    end
    current_frame.next_roll

    check_for_end_of_frame
  end


  private
  def check_for_end_of_frame
    if current_frame.strike?
      @strike_add += 2
      finish_frame
    elsif current_frame.spare?
      @spare_add = true
      finish_frame
    elsif current_frame.complete?
      finish_frame
    end
  end

  def finish_frame
    @frame_number += 1
  end

  def current_frame 
    @frames[@frame_number]
  end

  def previous_frame 
    @frames[@frame_number - 1]
  end
end
