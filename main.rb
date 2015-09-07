include Java

import java.awt.event.KeyEvent
import java.awt.event.KeyListener
import java.awt.event.ComponentListener
import java.awt.event.MouseListener
import java.awt.geom.Rectangle2D
import java.awt.Canvas
import java.awt.Color
import java.awt.Graphics
import java.awt.Font
import java.awt.FontMetrics
import java.awt.image.BufferedImage
import java.awt.Toolkit
import java.io.BufferedReader
import java.io.FileReader
import javax.imageio.ImageIO
import javax.swing.ImageIcon
import javax.swing.JFrame

MAIN_HOME = File.dirname(File.expand_path(__FILE__))
require 'singleton'
require MAIN_HOME + '/util/context'
require MAIN_HOME + '/util/subject'
require MAIN_HOME + '/util/strategy'
require MAIN_HOME + '/util/simplebreak'
require MAIN_HOME + '/util/observer'
require MAIN_HOME + '/util/spellcheck'
require MAIN_HOME + '/util/dictionary'
require MAIN_HOME + '/util/spellErrorHandler'
require MAIN_HOME + '/model/glyph'
require MAIN_HOME + '/model/character'
require MAIN_HOME + '/model/arrow_glyph'
require MAIN_HOME + '/model/image'
require MAIN_HOME + '/model/row'
require MAIN_HOME + '/model/command'
require MAIN_HOME + '/model/document'
require MAIN_HOME + '/visitor/visitor'
require MAIN_HOME + '/visitor/spellcheck'
require MAIN_HOME + '/commands/command_dispatch'
require MAIN_HOME + '/commands/backspace'
require MAIN_HOME + '/commands/insert'
require MAIN_HOME + '/commands/insertArrow'
require MAIN_HOME + '/commands/insertImage'
require MAIN_HOME + '/controller/controller'
require MAIN_HOME + '/controller/basicdraw'
require MAIN_HOME + '/controller/scroll'
require MAIN_HOME + '/view/view'
require MAIN_HOME + '/view/controllerview'

model = Document.new
controller = Scroll.new(BasicDraw.new(model, SimpleBreak.new))
#controller2 = Scroll.new(BasicDraw.new(model, NewBreak.new))
view = View.new(controller, model)
#view2 = View.new(controller, model)
