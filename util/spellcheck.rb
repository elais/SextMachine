class SpellChecker
  include Singleton
  def initialize
    @dictionary = Hash.new
    self.load (MAIN_HOME + "/dictionary/american-english")
  end

  def load path
    puts "Loading Dictionary"
    reader = BufferedReader.new(java.io.FileReader.new(path))
    begin
      word = reader.readLine
      @dictionary[word] = word
    end while word != nil
    puts "Dictionary laoded"
  end

  def isMispelled word
    return !@dictionary.has_key?(word)
  end
end
