class Question
    attr_accessor :total, :display
  def initialize() 
    @number1 = rand(1...20)
    @number2 = rand(1...20)
    @total = @number1 + @number2
    @display = "What does #{@number1} plus #{@number2} equal?"
  end
end