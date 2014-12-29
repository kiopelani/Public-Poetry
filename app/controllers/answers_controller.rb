class AnswersController < ApplicationController
  def show
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    respond_to do |format|
      if @answer.save
        format.html {redirect_to question_path(@question)}
        format.js {render :create}
      else
        render :'question/show'
      end
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    render :edit
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(answer_params)
      redirect_to question_answer_path(@question, @answer)
    else
      render :edit
    end
  end

   def destroy
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question)
  end

  def upvote
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.upvote
    respond_to do |format|
      if @answer.save
        format.html {redirect_to question_answer_path(@question, @answer)}
        format.js {render :upvote}
      end
    end
  end

  def downvote
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.downvote
    respond_to do |format|
      if @answer.save
        format.html {redirect_to question_answer_path(@question, @answer)}
        format.js {render :downvote}
      end
    end
  end

  # def show
  #   render inline: "#{params}"
  # end

private

  def answer_params
    params.require(:answer).permit(:content)
  end

end
