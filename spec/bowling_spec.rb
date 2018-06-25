require 'bowling'

RSpec.describe Bowling do

  before(:each) do
    @bowling = Bowling.new
  end

  context "frame with no strike or spare" do
    it "sets pins hit for the first roll" do
      @bowling.hit(5,4)
      expect(@bowling.game[5][:roll_one]).to eq 4
    end

    it "sets pins hit for the second roll" do
      @bowling.hit(5,4)
      @bowling.hit(5,3)
      expect(@bowling.game[5][:roll_two]).to eq 3
    end

    it "sums the pin count for each roll" do
      @bowling.hit(5,4)
      @bowling.hit(5,3)
      @bowling.frame_score 5
      expect(@bowling.game[5][:score]).to eq 7
    end
  end

  context "previous frame with a spare" do
    it "sums roll one count to previous frame result" do
      @bowling.hit(3,4)
      @bowling.hit(3,6)
      @bowling.frame_score 3

      @bowling.hit(4,5)
      @bowling.hit(4,2)
      @bowling.frame_score 4

      @bowling.frame_score_after_spare(3,4)

      expect(@bowling.game[3][:roll_one]).to eq 4
      expect(@bowling.game[3][:roll_two]).to eq 6
      expect(@bowling.game[4][:roll_one]).to eq 5
      expect(@bowling.game[4][:roll_two]).to eq 2
      expect(@bowling.game[3][:score]).to eq 15
      expect(@bowling.game[4][:score]).to eq 7
    end
  end

  context "previous frame with a strike" do

    context "current one with no strike or spare" do
      it "sums both rolls count to previous frame result"
    end

    context "current one with a spare" do
      it "sums both rolls count to previous frame result"
    end

    context "current one with a strike" do
      it "sums roll one count to previous frame result"
    end

  end

end