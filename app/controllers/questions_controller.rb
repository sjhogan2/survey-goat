class QuestionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # def new
  #   @question = Question.new
  # end

  def create
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.create(question_params)
  end

  def update
  end

  def destroy
  end

  private

  def question_params
    params.require(:question).permit(:question, :kind)
  end

end
