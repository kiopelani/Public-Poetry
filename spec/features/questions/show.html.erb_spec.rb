require 'rails_helper'

feature "Displays Question" do
  let!(:question) {create :question}

  scenario "displays question content" do
    visit question_path(question)
    expect(page).to have_content question.content
  end

  scenario "displays question votes" do
    visit question_path(question)
    expect(page).to have_content question.votes
  end

end

feature "A Question has answers" do
  let!(:question) {Question.create(:content => "I'm a question!")}
  let!(:answer) {question.answers.create(:content => "I'm an answer")}
  let!(:answers) {question.answers}

  scenario "Displays Answers for Question" do
    visit question_path(question)
    answers.each do |answer|
      expect(page).to have_content answer.content
      expect(page).to have_content answer.votes
    end
  end

  scenario "User can answer question" do
    visit question_path(question)
    within(".answer-form") do
      fill_in 'answer_content', :with => "That's an interesting question!"
    end
    click_button 'Answer'
    expect(page).to have_content answer.content
  end

end
