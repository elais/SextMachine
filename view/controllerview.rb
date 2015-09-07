class ControllerView < JFrame
  include KeyListener, Observer, ComponentListener
  def initialize model, controller
    super "Sext Machine"
    @document = model
    @controller = controller
    self.initUI
  end

  def initUI
    self.addKeyListener self
    @x= 0
    @y= 30
    self.setLayout nil
    self.setDefaultCloseOperation ::JFrame::EXIT_ON_CLOSE
    self.setSize 450, 400
    self.setLocationRelativeTo nil
    self.setVisible true
    @frameWidth = self.getWidth
    @frameHeight = self.getHeight
    @document.attach self
  end

  def update
    g = getGraphics()
    self.paint(g)
    self.repaint
  end

  def paint g
    @document.draw(g, @x, @y, self.getContentPane.getSize.width,
                   self.getContentPane.getSize.height)

  end

  def window(x, y)
    @frameWidth = x
    @frameHeight = y
  end

  def keyPressed e
    self.repaint
    c = e.getKeyChar().chr
    if c == "f".chr
      @document.addGlyph(Arrow.new())
    else
      @document.addGlyph(CharacterGlyph.new(c))
    end
  end

  def keyTyped e
  end

  def keyReleased e
  end

  def componentResized
    @document.notifySizeChange
  end
end
