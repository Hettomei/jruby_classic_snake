class Score

  def initialize
    @score = 0
  end

  def add
    @score += 10
  end

  def score
    @score
  end

  def display
    "score : #{score}"
  end
end

