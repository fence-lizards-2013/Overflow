class QuestionsController < ApplicationController
  
  def index
    p "*"*50
    @user = current_user
    p @user
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(params[:question])
    redirect_to question_path(@question)
  end
end
