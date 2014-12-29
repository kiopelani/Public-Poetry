class Comment < ActiveRecord::Base
  belongs_to :poem

  def upvote
    self.votes += 1
  end

  def downvote
    self.votes -= 1
  end

end
