class BasicDraw < Controller
  def initialize document, format
    @document = document
    @format = format
    @commander = CommandDispatcher.new
    @spellCheckEnabled = true
  end


  def draw(g, x, y, frameWidth, frameHeight)
    self.setGraphics g
    rows = self.format(frameWidth, frameHeight)
    if @spellCheckEnabled
      visitor = SpellCheckVisitor.new(self)
      rows.each do |row|
        row.draw(g, x, y)
        y += row.getHeight
        row.accept visitor
      end
    else
      rows.each do |row|
        row.draw(g, x, y)
        y += row.getHeight
      end
    end
  end

  def document
    @document
  end

  def handleEvent e
    keyCode = e.getKeyCode
    if !e.isControlDown && (keyCode > 1 && keyCode < 223)
      if keyCode == KeyEvent::VK_BACK_SPACE
        @commander.undo
      elsif keyCode != KeyEvent::VK_BACK_SPACE
#        if e.getKeyChar.chr == "f".chr
#          c = e.getKeyChar.chr
#          command = InsertArrow.new(@document, Arrow.new)
#          @commander.execute(command)
        c = e.getKeyChar.chr
        command = Insert.new(@document, CharacterGlyph.new(c))
        @commander.execute(command)
      end
    elsif e.isControlDown && keyCode == 85
      @commander.redo
    elsif e.isControlDown && keyCode == 73
      command = InsertPix.new(@document, Pix.new)
      @commander.execute(command)
    end
  end

  def keyTyped e
    self.handleEvent e
  end

  def handleSpelling word, glyphs
    glyphs.each do |glyph|
      glyph.select(@graphics, Color::RED, Color::WHITE, glyph.getWidth, glyph.getHeight)
    end
  end

  def format(frameWidth, frameHeight)
#    rowGlyphs = Array.new
    rowGlyphsList = @format.linebreak(@document.getGlyphs, frameWidth, frameHeight)
    return rowGlyphsList
  end


  def mouseClicked e
    x = e.getX
    y = e.getY
    puts "mouse clicked at position " + x + " , " + y
  end

  def setGraphics g
    @graphics = g
  end
end
