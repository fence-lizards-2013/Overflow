require "spec_helper"

describe Question do
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

  context "#view_count" do
    it "has a default value of 0" do
      expect(question.save.view_count).to eq(0)
    end

  end

  context "#viewed!" do
    it "updates the view_count attr in the database" do
      expect(question.save.viewed!.view_cound).to eq(1)
    end
  end
end
