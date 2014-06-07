require_relative '../lib/BowlingGame'
require_relative '../lib/Frame'

describe BowlingGame do
  it "should return 0 for a 10 zero rolls" do
    g = BowlingGame.new
    (1..10).each do
      2.times { g.roll(0) }
    end
    g.score.should == 0
  end

  it "should return 20 for a 20 1 pin rolls" do
    g = BowlingGame.new
    (1..10).each do
      2.times { g.roll(1) } 
    end
    g.score.should == 20
  end

  it "should properly score a first frame spare" do
    g = BowlingGame.new
    2.times { g.roll(5) }
    (2..10).each do 
      2.times { g.roll(1) }
    end
    g.score.should == 29
  end

  it "should properly score two spares in a row" do
    g = BowlingGame.new
    2.times { g.roll(5) }
    2.times { g.roll(5) }
    (3..10).each do 
      2.times { g.roll(1) }
    end
    g.score.should == (15 + 11 + 16)
  end

  it "should properly score a first frame strike" do
    g = BowlingGame.new
    g.roll(10)
    (2..10).each do
      2.times { g.roll(1) }
    end
    g.score.should == (12 + 18)
  end

  it "should properly score two strikes in a row" do
    g = BowlingGame.new
    g.roll(10)
    g.roll(10)
    (3..10).each do
      2.times { g.roll(1) }
    end
    g.score.should == (21 + 12 + 16)
  end

  it "should properly score three strikes in a row" do
    pending "Doesn't work yet"
    g = BowlingGame.new
    g.roll(10)
    g.roll(10)
    g.roll(10)
    (4..10).each do
      2.times { g.roll(1) }
    end
    g.score.should == (30 + 21 + 12 + 14)
  end

  it "should properly score a perfect game" do
    pending "Doesn't work yet"
    g = BowlingGame.new
    (1..10).each do
      g.roll(10) 
    end
    g.score.should == 300 
  end
end
