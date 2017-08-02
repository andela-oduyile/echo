class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find.new(answers_params)
    @answer.user = current_user
    @answer.save

    redirect_to question_path
  end

  def update
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id]).destroy
    redirect_to root_path
  end

  private
    def answers_params
      params.require(:answer).permit(:content)
    end
end
