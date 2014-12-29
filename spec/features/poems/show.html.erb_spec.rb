require 'rails_helper'

feature "Displays Poem" do
  let!(:poem) {create :poem}

  scenario "displays poem content" do
    visit poem_path(poem)
    expect(page).to have_content poem.content
  end

  scenario "displays poem votes" do
    visit poem_path(poem)
    expect(page).to have_content poem.votes
  end

end

feature "A Poem has comments" do
  let!(:poem) {Poem.create(:content => "Roses are red, violets are blue")}
  let!(:comment) {poem.comments.create(:content => "This poem is amazing!")}
  let!(:comments) {poem.comments}

  scenario "Displays Comments for Poem" do
    visit poem_path(poem)
    comments.each do |comment|
      expect(page).to have_content comment.content
      expect(page).to have_content comment.votes
    end
  end

  scenario "User can comment on poems" do
    visit poem_path(poem)
    within(".comment-form") do
      fill_in 'comment_content', :with => "This is my favorite poem ever!"
    end
    click_button 'Comment'
    expect(page).to have_content comment.content
  end

end
