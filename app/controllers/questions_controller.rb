class QuestionsController < ApplicationController
  def index
    @question = Question.new
    @questions = Question.all
    @quote = QuestionsHelper::Quote.new.get_quote
  end

  def create
    @question = Question.new(question_params)
    respond_to do |format|
      if @question.save
        format.html {redirect_to root_path}
        format.js {render :create}
      else
        @questions = Question.all
        format.html {render :index}
        format.js {render :index}
      end
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers
  end

  def edit
    @question = Question.find(params[:id])
    render :edit
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path
  end

  def upvote
    @question = Question.find(params[:id])
    @question.upvote
    respond_to do |format|
      if @question.save
        format.html {redirect_to root_path}
        format.js {render :upvote}
      end
    end
  end

  def downvote
    @question = Question.find(params[:id])
    @question.downvote
    respond_to do |format|
      if @question.save
        format.html {redirect_to root_path}
        format.js {render :downvote}
      end
    end
  end

  private

  def question_params
    params.require(:question).permit(:content)
  end

end
