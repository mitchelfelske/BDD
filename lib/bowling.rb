class Bowling
  attr_reader :score
  attr_reader :game

  def initialize
    @score = 0
    @game = Array.new(10) { Hash.new }
  end

  def hit(frame, pin_count)
    if @game[frame][:roll_one].nil?
      @game[frame][:roll_one] = pin_count
    else
      @game[frame][:roll_two] = pin_count
    end
    @score += pin_count
  end

  def frame_score frame
    @game[frame][:score] = @game[frame][:roll_one] + @game[frame][:roll_two]
  end

  def frame_score_after_spare(prev_frame, current_frame)
    @game[prev_frame][:score] += @game[current_frame][:roll_one]
  end
end