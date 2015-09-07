class View < JFrame
  include Observer, KeyListener, ComponentListener
  def initialize controller, document
    super("Sext Machine")
    @controller = controller
    @document = document
    self.initUI
  end


  def initUI
    self.addKeyListener @controller
    self.setLayout nil
    self.setDefaultCloseOperation ::JFrame::EXIT_ON_CLOSE
    self.setSize 450, 400
    self.setLocationRelativeTo nil
    self.setVisible true
    @x = 10
    @y = 35
    @frameWidth = self.getWidth
    @frameHeight = self.getHeight
    @document.attach self
  end

  def update
    self.repaint
#    g = getGraphics
#    self.paint(g)
  end

  def paint g
    super
    @controller.draw(g, @x, @y, self.getContentPane.getSize.width,
                     self.getContentPane.getSize.height)
  end

end
