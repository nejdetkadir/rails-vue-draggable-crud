class TodosController < ApplicationController
  before_action :set_todo, only: [:update, :destroy]

  def index
    @completed = current_user.todos.completed
    @uncompleted = current_user.todos.uncompleted
  end

  def create
    @todo = current_user.todos.create(todo_params)    
    render json: @todo.save ? @todo : @todo.errors 
  end

  def update
    render json: @todo.update(todo_params) ? @todo : @todo.errors 
  end

  def destroy
    render json: @todo.destroy 
  end

  private

  def todo_params
    params.require(:todo).permit(:content, :completed)
  end

  def set_todo
    @todo = current_user.todos.find(params[:id])
  end
end
