# Top level class for BowloingGame.
# Implements two main public methids:
#   - score
#   - roll(pins)
#
class BowlingGame
  def initialize
    @frames = (0..12).map { |num|  Frame.new(num) }
    @frame_number = 1
  end

  def score
    @frames.select { |f| f.scoring_frame? }.
            inject(0) { |score, frame| score + frame.score }
  end

  def roll(pins)
    current_frame.add_roll(pins)
    add_spare_bonus(pins)
    add_strike_bonus(pins)
    check_for_end_of_frame
  end


  private
  def add_spare_bonus(pins)
    if previous_frame.spare? && current_frame.first_roll?
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
    if strikes_in_past_two_frames? && current_frame.first_roll?
      two_frames_ago.add_to_bonus_score(pins)
    end
  end

  def strikes_in_past_two_frames?
     previous_frame.strike? && two_frames_ago.strike?
  end

  def check_for_end_of_frame
    @frame_number += 1  if current_frame.complete?
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
