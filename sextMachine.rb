include Java

import java.awt.event.KeyEvent
import java.awt.event.KeyListener
import java.awt.image.BufferedImage
import java.awt.Color
import java.awt.Container
import java.awt.Dimension
import java.awt.Font
import java.awt.Graphics
import java.awt.Toolkit
import javax.swing.JFrame
import java.swing.WindowConstants

class Sext < JFrame
  include KeyListener
  def initialize
    super "Sext Machine"
    self.initUI
  end

  def initUI

    self.addKeyListener self

    @text = " "
    self.setLayout nil
    self.setDefaultCloseOperation ::JFrame::EXIT_ON_CLOSE
    self.setSize 450, 400
    self.setLocationRelativeTo nil
    self.setVisible true
  end

  def paint g
    g.drawString(@text, 15, 50)
  end

  def keyPressed e
  end



  def keyTyped e
    @text += e.getKeyChar().chr
    self.repaint
  end

  def keyReleased e
  end

  # Handle the key typed event from the text field.

end

Sext.new.getRootPane().setOpaque(false)
