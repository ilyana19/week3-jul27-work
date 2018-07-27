class Task
  attr_accessor :description, :due_date

  def initialize(description, due_date)
    @description = description
    @due_date = due_date
  end
end

# task1 = Task.new("do ruby hw", "Jul29")
# task2 = Task.new("hw2", "Jul28")
# task3 = Task.new("hw3", "Jul31")
#
# p task1.description # => "do ruby hw"
# p task2.due_date # => "Jul28"
# p task2.due_date = "Aug1" # => "Aug1"
# p task3.due_date # => "Jul31"