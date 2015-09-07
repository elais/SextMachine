class Document
  include Context, Subject, Command
  def initialize
    @glyphs = Array.new
    @observers = Array.new
    @commands = Array.new
  end

  def attach v
    @observers.push(v)
  end

  def dettach
  end

  def notify_observers
    @observers.each do |observer|
      observer.update()
    end
  end

  def notifySizeChange
    self.notify_observers
  end

  def addGlyph g
    @glyphs.push(g)
    self.notify_observers
  end

  def draw(g, x, y, frameWidth, frameHeight)
    rows = self.format(frameWidth, frameHeight)
    rows.each do |row|
      row.draw(g, x, y)
      y += row.getHeight
    end
  end

  def numGlyphs
    return @glyphs.length
  end

  def getGlyphs
    return @glyphs
  end

  def removeGlyph g
    @glyphs.delete(g)
    self.notify_observers
  end

  def setFormat f
    @format = f
  end

end
