class CommentsController < ApplicationController
  def show
    @poem = Poem.find(params[:poem_id])
    @comment = Comment.find(params[:id])
  end

  def create
    @poem = Poem.find(params[:poem_id])
    @comment = @poem.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html {redirect_to poem_path(@poem)}
        format.js {render :create}
      else
        render :'poem/show'
      end
    end
  end

  def edit
    @poem = Poem.find(params[:poem_id])
    @comment = Comment.find(params[:id])
    render :edit
  end

  def update
    @poem = Poem.find(params[:poem_id])
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      redirect_to poem_comment_path(@poem, @comment)
    else
      render :edit
    end
  end

   def destroy
    @poem = Poem.find(params[:poem_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to poem_path(@poem)
  end

  def upvote
    @poem = Poem.find(params[:poem_id])
    @comment = Comment.find(params[:id])
    @comment.upvote
    respond_to do |format|
      if @comment.save
        format.html {redirect_to poem_comment_path(@poem, @comment)}
        format.js {render :upvote}
      end
    end
  end

  def downvote
    @poem = Poem.find(params[:poem_id])
    @comment = Comment.find(params[:id])
    @comment.downvote
    respond_to do |format|
      if @comment.save
        format.html {redirect_to poem_comment_path(@poem, @comment)}
        format.js {render :downvote}
      end
    end
  end

private
  def comment_params
    params.require(:comment).permit(:content)
  end

end
