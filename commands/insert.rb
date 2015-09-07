class Insert
  include Command
  def initialize document, char
    @document = document
    @glyph = char
  end

  def execute
    @document.addGlyph(@glyph)
  end

  def unExecute
    @document.removeGlyph(@glyph)
  end
end
