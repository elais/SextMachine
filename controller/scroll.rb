class Scroll < Controller
  def initialize concrete
    @concrete = concrete
    @offset = 0
  end

  def handleEvent e
    keyCode = e.getKeyCode
    if keyCode == KeyEvent::VK_DOWN
      self.increaseStartRow
      @concrete.document.notify_observers
    elsif keyCode == KeyEvent::VK_UP
      self.decreaseStartRow
      @concrete.document.notify_observers
    else
      @concrete.handleEvent e
      @concrete.document.notify_observers
    end
  end

  def attach s
    @simpleDraw = s
  end

  def decreaseStartRow
    @offset -= 5
    if @offset < 0
      @offset = 0
    end
  end

  def draw(g, x, y, frameWidth, frameHeight)
    if frameHeight - @offset > frameHeight
      @concrete.draw(g, x, y, frameWidth, frameHeight)
    else
      @concrete.draw(g, x, y - @offset, frameWidth, frameHeight)
    end
  end

  def increaseStartRow
    @offset += 5
  end

  def format frameWidth, frameHeight
    rowGlyph_list = @format.linebreak(@document.getGlyphs, frameWidth, frameHeight)
    return rowGlyph_list
  end

  def setFormatStrategy f
    @format = f
  end

  def getFormatStrategy
    return @format
  end

  def keyPressed e
    self.handleEvent e
  end
end
