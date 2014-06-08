class BowlingGame

  def initialize
    @frames = (0..12).map { |num|  Frame.new(num) }
    @frame_number = 1
  end

  def score
    @frames.select { |f| f.real }.
            inject(0) { |result, elem| result + elem.score }
  end

  def roll(pins)
    current_frame.add_to_score(pins)
    add_spare_bonus(pins)
    add_strike_bonus(pins)
    check_for_end_of_frame
  end


  private
  def add_spare_bonus(pins)
    if previous_frame.spare? && first_roll
      previous_frame.add_to_bonus_score(pins)
    end
  end

  def add_strike_bonus(pins)
    add_strike_bonus_to_previous_frame(pins)
    add_strike_bonus_to_two_frames_ago(pins)
  end

  def add_strike_bonus_to_previous_frame(pins)
    if previous_frame.strike?
      previous_frame.add_to_bonus_score(pins)
    end
  end

  def add_strike_bonus_to_two_frames_ago(pins)
    if previous_frame.strike? && two_frames_ago.strike? && first_roll
      two_frames_ago.add_to_bonus_score(pins)
    end
  end

  def check_for_end_of_frame
    @frame_number += 1  if current_frame.complete?
  end

  def first_roll
    current_frame.roll == 1
  end

  def second_roll
    current_frame.roll == 2
  end

  def current_frame
    @frames[@frame_number]
  end

  def previous_frame
    @frames[@frame_number - 1]
  end

  def two_frames_ago
    @frames[@frame_number - 2]
  end
end
