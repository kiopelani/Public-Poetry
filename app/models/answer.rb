class Answer < ActiveRecord::Base
  belongs_to :question

  def upvote
    self.votes += 1
  end

  def downvote
    self.votes -= 1
  end

end
