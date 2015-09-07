class Arrow < Glyph
  def initialize
    @width = 30
    @height = 12
  end

  def draw(g, x, y)
    g.drawString("==>", x, y)
  end
  def getWidth
    return @width
  end

  def getHeight
    height = @fontMetric.getHeight
    return height
  end

#  def getWidth
#    return @width
  #  end

#  def getHeight
#    return @height
#  end

end

