class QuestionsController < ApplicationController

  def index
    @user = current_user
    @questions = choose_sort(params[:sort_choice])
  end

  def show
    @question = Question.find(params[:id])
    @question.viewed!
  
    @answer = Answer.new

  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(params[:question])
    redirect_to question_path(@question)
  end

private

  def choose_sort(sort_choice)

    case sort_choice
    when "view"
      Question.order(:view_count).reverse
    when "answer"
      Question.answer_count_sort
    when "created"
      Question.order(:created_at).reverse
    else
      Question.order(:view_count).reverse
    end
  end
end
