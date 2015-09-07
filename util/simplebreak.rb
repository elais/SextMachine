class SimpleBreak < Format
  def linebreak(g, width, height)
    glyphs = g
    rowGlyphs = Array.new
    r = Row.new
    rowWidth = 0
    margin = 10
    glyphs.each do |glyph|
      if rowWidth > (width - margin)
        rowGlyphs.push(r)
        rowWidth = 0
        r = Row.new
      end
      r.addGlyph(glyph)
      rowWidth += glyph.getWidth
    end
    rowGlyphs.push(r)
    return rowGlyphs
  end
end
