class Poem < ActiveRecord::Base
  has_many :comments
  validates :content, presence: true

  def upvote
    self.votes += 1
  end

  def downvote
    self.votes -= 1
  end

end
