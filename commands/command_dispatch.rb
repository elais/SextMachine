class CommandDispatcher
  def initialize
    @commands = Array.new
    @currentCommand = 0
  end

  def setCommand cmd
    @commands.insert(@currentCommand, cmd)
  end

  def removeCommand i
    @commands.remove(i)
  end

  def execute cmd
#    if @currentCommand < @commands.length - 1
#      @commands.length.step(@currentCommand, -1) do |i|
#        puts i
#        removeCommand i
#      end
#    end
    cmd.execute
    self.setCommand cmd
    @currentCommand += 1
  end

  def undo
    if @currentCommand != 0
      @currentCommand -= 1
    end
    @commands[@currentCommand].unExecute
  end

  def redo
    if @currentCommand != @commands.length - 1
      @commands[@currentCommand].execute
      @currentCommand += 1
    end
  end
end
