require 'spec_helper'

describe Idea do
  let(:idea) { create(:idea) }
  subject {idea}

  it {should respond_to(:title)}
  it {should respond_to(:description)}
  it {should respond_to(:added_by)}


  it {should be_valid}

  it "should not create without title" do
    idea.title = nil
    expect(idea).to_not be_valid
  end

  it "should not create without description" do
    idea.description = nil
    expect(idea).to_not be_valid
  end

  it "should not create without added_by" do
    idea.added_by = nil
    expect(idea).to_not be_valid
  end
end
