require_relative 'task'

class TodoList < Task
  def initialize
    @tasks = []
  end

  def add_task(task)
    @tasks << task
  end
end

task1 = Task.new("homework1", "2018/07/27")
task2 = Task.new("homework2", "2018/07/27")
task3 = Task.new("homework3", "2018/07/27")

list = TodoList.new
list.add_task(task1)
list.add_task(task2)
list.add_task(task3)

p list

task3.due_date = "2018/07/28"

puts ""
p list