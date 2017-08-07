class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answers_params)
    @answer.user = current_user
    @answer.save

    redirect_to question_path(@question)
  end

  def update
    # should a user be able to update an answer
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    if @answer.user == current_user
      @answer.destroy
      redirect_to @question
    end
  end

  private
    def answers_params
      params.require(:answer).permit(:content)
    end
end
