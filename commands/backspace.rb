class Backspace
  include Command
  def initialize document, glyph
    @document = document
    @glyph = glyph
  end

  def execute
    @document.removeGlyph(@glyph)
  end

  def unExecute
    @document.addGlyph(@glyph)
  end
end
