require 'rails_helper'

feature "user can edit a question" do
  let!(:question) {create :question}
  scenario "question is updated when form is submitted" do
    visit edit_question_path(question)
    within('.question-form') do
      fill_in 'question_content', :with => 'Is there life on mars?'
    end
    click_button 'Update'
    expect(page).to have_content 'Is there life on mars?'
  end
end
