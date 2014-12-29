require 'rails_helper'

feature "user can edit a poem" do
  let!(:poem) {create :poem}
  scenario "poem is updated when form is submitted" do
    visit edit_poem_path(poem)
    within('.poem-form') do
      fill_in 'poem_content', :with => 'Is there life on mars?'
    end
    click_button 'Update'
    expect(page).to have_content 'Is there life on mars?'
  end
end
