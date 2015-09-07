class SpellCheckVisitor < Visitor
  def initialize controller
    @currentWord = ""
    @currentGlyphs = Array.new
    @glyphs = Array.new
    @controller = controller
    @spellChecker = SpellChecker.instance
  end

  def visitChar c
    if c.getChar.match(/^[[A-Za-z]]$/) || c.getChar.match("'")
      @currentWord << c.getChar
      @currentGlyphs.push(c)
    else
      @glyphs.delete_at(-1)
      self.spellCheck
      @glyphs.clear
    end
  end

  def spellCheck
    word = @currentWord.downcase
    if word != "" && @spellChecker.isMispelled(word)
      @controller.handleSpelling(@currentWord, @glyphs)
    else
      puts "#{word} last correctly spelled word"
    end
    @currentWord = ""
    @currentGlyphs.clear
  end

  def visitImage
  end

  def visitRow row
    g = row.getGlyphs
    g.each do |glyph|
      @glyphs.push(glyph)
      glyph.accept(self)
    end
    if @currentWord.length > 0
      self.spellCheck
    end
  end
end
