module ApplicationHelper
  def sec(todo)
    seconds = 7.days - (Time.now - todo.created_at)
    days = (seconds/86400).to_i  
    remaining_seconds = seconds%86400
    hours = (remaining_seconds/3600).to_i 
    return "You have #{days} days and #{hours} hours to complte this task"
  end
end
