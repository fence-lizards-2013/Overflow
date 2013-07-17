require "spec_helper"

describe "Questions" do
  let(:title) { 'Question1' }
  let(:content) { 'Content1' }
  let(:question) { Question.new(title: title, content: content)  }


  context "#title" do
    it "requires a title" do
      expect(question.title).to eq(title)
    end
  end

  context "#content" do
    it "requires a content" do
      expect(question.title).to eq(title)
    end
  end
end
