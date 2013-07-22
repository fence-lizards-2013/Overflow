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
    
    tags = create_tags(params[:question][:tags])
    params[:question].delete(:tags)
    @question = Question.create(params[:question])
    @question.tags << tags
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

  def create_tags(tags)
    tag_list = []
    tags.split(/[\s,]+/).each do |tag|
      tag_list << Tag.create(tag_name: tag)
    end
    tag_list
  end
end
