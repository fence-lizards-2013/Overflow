class QuestionsController < ApplicationController

  def index
    # REVIEW: @user = current_user WHY?? why not use current_user straight in the view?
    @user = current_user
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    # REVIEW: I would move the viewed! in an after_filter (one of the few times it's actually useful :) )
    @question.viewed!
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    # REVIEW: what happens if you fail to create? your user will know nothing about it as you'll fail silently and
    # just redirect.
    @question = Question.create(params[:question])
    redirect_to question_path(@question)
  end
end
