require "spec_helper"

describe Question do
  let(:title) { 'Question1' }
  let(:content) { 'Content1' }
  let(:question) { Question.new(title: title, content: content)  }

  it "requires a title" do
    expect(Question.new(content: content)).to be_invalid
  end

  it "requires content" do
    expect(Question.new(title: title)).to be_invalid
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

  context "#view_count" do
    it "has a default value of 0" do
      question.save
      expect(question.view_count).to eq(0)
    end

  end

  context "#viewed!" do
    it "updates the view_count attr in the database" do
      question.save
      question.viewed!
      expect(question.view_count).to eq(1)
    end
  end
end
