class TodosController < ApplicationController
  before_action :set_todo, only: [:update, :destory]

  def index
    @completed = Todo.completed
    @uncompleted = Todo.uncompleted
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user = current_user
    
    render json: @todo.save ? @todo : @todo.errors 
  end

  def update
    if check_me(@todo.user_id)
      render json: @todo.update(todo_params) ? @todo : @todo.errors 
    else
      render json: { message: "Something went wrong" }, status: :unauthorized
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:content, :completed)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def check_me(user_id)
    current_user.id == user_id
  end
end
