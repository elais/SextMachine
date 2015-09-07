class CharacterGlyph < Glyph
  def initialize c
    @c = c
    @font = Font.new("Helvetica", Font::PLAIN, 12)
    @canvas = Canvas.new
    @fontMetric = @canvas.getFontMetrics(@font)
  end

  def draw(g, x, y)
    @fontMetric = g.getFontMetrics(@font)
    g.setFont(@font)
    g.drawString(@c.to_s + "", x, y)
  end

  def getWidth
    width = @fontMetric.stringWidth(@c)
    return width
  end

  def getHeight
    height = @fontMetric.getHeight
    return height
  end

  def select(graphics, highLightColor, fontColor, x, y)
    #g = @canvas.getGraphics
    previousColor = graphics.getColor
    graphics.setColor(highLightColor)
    #rect = self.getFontrMetrics(graphics).getStringBounds(self.getChar, graphics)
    #graphics.drawRect(x, y - rect.getHeight.to_i, rect.getWidth.to_i, rect.getHeight.to_i)
    #graphics.fillRect(x, y - rect.getHeight.to_i, rect.getWidth.to_i, rect.getHeight.to_i)
    ##raphics.setColor(fontColor)
    self.draw(graphics, x, y)
    graphics.setColor(previousColor)
    #self.draw(g, x, y)
    #g.setColor(previousColor)
  end

  def getChar
    @c
  end

  def setFont f
    @font = f
  end

  def getFont
    @font
  end
  def accept visitor
    visitor.visitChar(self)
  end

  def getFontrMetrics g
    return g.getFontMetrics
  end
end
