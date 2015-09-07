class Row < Glyph
  def initialize
    @glyph_list = Array.new

  end

  def draw(g, x, y)
    col = x
    row = y
    @glyph_list.each do |glyph|
      glyph.draw(g, col, row)
      col += glyph.getWidth
    end
  end

  def getWidth
    @width = 0
    @glyph_list.each do |glyph|
      @width += glyph.getWidth
    end
    return @width
  end

  def addGlyph g
    @glyph_list.push(g)
  end

  def removeGlyph g
    @glyph_list.delete(g)
  end

  def getHeight
    @height = 12
    #@glyph_list.each do |glyph|
    #  @height = glyph.getHeight
    #end
    return @height
  end

  def getGlyphs
    @glyph_list
  end

  def accept visitor
    visitor.visitRow(self)
  end
end
