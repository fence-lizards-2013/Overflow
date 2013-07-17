require "spec_helper"

describe "Questions" do
  let(:title) { 'Question1' }
  let(:content) { 'Content1' }
  let(:question) { Question.new(title: title, content: content)  }

  it "requires a title" do
    expect(Question.create(content: content)).to be_invalid
  end

  it "requires content" do
    expect(Question.create(title: title)).to be_invalid
  end

  context "#title" do
    it "returns a title" do
      expect(question.title).to eq(title)
    end
  end

  context "#content" do
    it "returns a content" do
      expect(question.title).to eq(title)
    end
  end
end
