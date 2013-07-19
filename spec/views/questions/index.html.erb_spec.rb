require "spec_helper"

describe "questions/index.html.erb" do
  before(:each) do
    assign(:questions, [
        stub_model(Question, :title => "Test title", :content => "Testoignwo ing"),
        stub_model(Question, :title => "Test title 2", :content => "Twenweo siengmose im"),
        ])
    render
  end

  it "lists all questions" do
    expect(rendered).to have_content("Test title")
    expect(rendered).to have_content("Test title 2")
  end

  it "should have question titles as links" do
    expect(rendered).to have_link("Test title")
    expect(rendered).to have_link("Test title 2")
  end

  it "should have awesome header" do
    expect(rendered).to have_content("DO I LOOK FAT IN DIS??")
  end

end
