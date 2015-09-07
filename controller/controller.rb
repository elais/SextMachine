class Controller
  include KeyListener, ComponentListener, MouseListener, Context, SpellingHandler
#  def initialize document, format
#    @document = document
#    @format = format
#  end

  def format frameWidth, frameHeight
  end

  def handleEvent e
  end

  def draw g, x, y, frameWidth, frameHeight
  end

  def handleEvent e, c, keyCode
  end

  def keyPressed e
  end

  def keyTyped e
  end

  def keyReleased e
  end

  def setGraphics
  end

  def mouseClicked e
    x = e.getX
    y = e.getY
    puts "mouse clicked at position " + x + " , " + y
  end
end
