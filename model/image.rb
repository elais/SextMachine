class Pix < Glyph
  def initialize
    @image = nil
  end

  def draw g, x, y
    g.drawImage(self.getImage, x +3, y, nil)
  end

  def getWidth
    self.getImage.getWidth + 2
  end

  def getHeight
    self.getImage.getHeight + 15
  end

  def accept visitor
    visitor.visitPicture(self)
  end

  def getImage
    if @image == nil
      pix = File.absolute_path(File.expand_path(MAIN_HOME + '/util/images/e405.png'))
      @image = ImageIO.read(java.io.File.new(pix))
    end
    return @image
  end
end
