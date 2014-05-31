require_relative '../lib/BowlingGame'

describe BowlingGame do
  it "should return 0 for a 10 zero rolls" do
    g = BowlingGame.new
    (1..10).each { g.roll(0) }
    g.score.should == 0
  end

  it "should return 10 for a 10 1 pin rolls" do
    g = BowlingGame.new
    (1..10).each { g.roll(1) }
    g.score.should == 10
  end

  it "should properly score a first frame spare" do
    g = BowlingGame.new
    g.roll(5)
    g.roll(5)
    (1..9).each { g.roll(1) }
    g.score.should == 20
  end

  it "should properly score a first frame strike" do
    g = BowlingGame.new
    g.roll(10)
    (1..9).each { g.roll(1) }
    g.score.should == 21
  end
end
