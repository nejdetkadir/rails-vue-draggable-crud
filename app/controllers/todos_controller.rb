class TodosController < ApplicationController
  def index
    @completed = Todo.completed
    @uncompleted = Todo.uncompleted
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user = current_user
    
    render json: @todo.save ? @todo : @todo.errors 
  end

  private

  def todo_params
    params.require(:todo).permit(:content, :is_completed)
  end
end
