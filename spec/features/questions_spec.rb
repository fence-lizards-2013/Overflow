require "spec_helper"

describe "new question page" do
  before(:each) do
    visit new_question_path
  end

  it "should have awesome header" do
    expect(page).to have_content("DO I LOOK FAT IN DIS??")
  end

  it "should have subheader of form" do
    expect(page).to have_content("New Question Form")
  end

  it "should have empty text_field" do
  end
end
