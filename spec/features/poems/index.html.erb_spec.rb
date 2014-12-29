require 'rails_helper'

feature "Poem Index" do
  let!(:poem) {create :poem}
  let!(:poems) { [poem, create(:poem)] }

  scenario "displays all poems" do
    visit root_path
    poems.each do |t|
      expect(page).to have_content t.title
      expect(page).to have_content t.votes
    end
  end

  scenario "clicking on the poem redirects to poem show page" do
    visit root_path
    click_on poem.title
    expect(current_path).to eq poem_path(poem)
    expect(page).to have_content poem.title
    expect(page).to_not have_content poems.last.title
  end
end

feature "Create new poem" do
  let!(:poem) {create :poem}
  let!(:poems) { [poem, create(:poem)] }
  scenario "creates a new poem when form is submitted" do
    visit root_path
    within("#new_poem") do
      fill_in 'poem_title', :with => 'Human or Machine'
      fill_in 'poem_content', :with => 'Do androids dream of electric sheep?'
    end
    click_button 'Add'
    expect(page).to have_content poem.title
  end
end
