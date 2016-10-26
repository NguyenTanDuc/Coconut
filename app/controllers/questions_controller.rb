class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
    @question.answers.build
  end

  def create
    @question = Question.new question_params
    if @question.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @question = Question.find_by id: params[:id]
  end

  def update
    @question = Question.find_by id: params[:id]
    if @question.update_attributes question_params
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def question_params
    params.require(:question).permit :title, answers_attributes: [:id, :description, :_destroy]
  end
end
