class PoemsController < ApplicationController
  def index
    @poem = Poem.new
    @poems = Poem.all
    # @quote = PoemsHelper::Quote.new.get_quote
  end

  def create
    @poem = Poem.new(poem_params)
    respond_to do |format|
      if @poem.save
        format.html {redirect_to root_path}
        format.js {render :create}
      else
        @poems = Poem.all
        format.html {render :index}
        format.js {render :index}
      end
    end
  end

  def show
    @poem = Poem.find(params[:id])
    @comment = Comment.new
    @comments = @poem.comments
  end

  def edit
    @poem = Poem.find(params[:id])
    render :edit
  end

  def update
    @poem = Poem.find(params[:id])
    if @poem.update_attributes(poem_params)
      redirect_to @poem
    else
      render :edit
    end
  end

  def destroy
    @poem = Poem.find(params[:id])
    @poem.destroy
    redirect_to root_path
  end

  def upvote
    @poem = Poem.find(params[:id])
    @poem.upvote
    respond_to do |format|
      if @poem.save
        format.html {redirect_to root_path}
        format.js {render :upvote}
      end
    end
  end

  def downvote
    @poem = Poem.find(params[:id])
    @poem.downvote
    respond_to do |format|
      if @poem.save
        format.html {redirect_to root_path}
        format.js {render :downvote}
      end
    end
  end

  private

  def poem_params
    params.require(:poem).permit(:content)
  end

end
