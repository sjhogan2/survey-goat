class SurveysController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def new
    @survey = Survey.new
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def create
    @survey = Survey.new(survey_params)
    @user = current_user
    @survey.user = @user
    @survey.save!

    if @survey.save
      redirect_to edit_survey_path(@survey)
    else
      render :new
    end
  end

  def update
    @survey = Survey.find(params[:id])

    if @survey.update_attributes(survey_params)
      redirect_to survey_path(@survey)
    else
      render :edit
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    redirect_to surveys_path
  end

  protected

  def survey_params
    params.require(:survey).permit(:title)
  end

end
