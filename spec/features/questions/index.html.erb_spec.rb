require 'rails_helper'

feature "Question Index" do
  let!(:question) {create :question}
  let!(:questions) { [question, create(:question)] }

  scenario "displays all questions" do
    visit root_path
    questions.each do |t|
      expect(page).to have_content t.content
      expect(page).to have_content t.votes
    end
  end

  scenario "clicking on the question redirects to question show page" do
    visit root_path
    click_on question.content
    expect(current_path).to eq question_path(question)
    expect(page).to have_content question.content
    expect(page).to_not have_content questions.last.content
  end
end

feature "Create new question" do
  let!(:question) {create :question}
  let!(:questions) { [question, create(:question)] }
  scenario "creates a new question when form is submitted" do
    visit root_path
    within("#new_question") do
      fill_in 'question_content', :with => 'Do androids dream of electric sheep?'
    end
    click_button 'Add'
    expect(page).to have_content question.content
  end
end
