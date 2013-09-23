require 'spec_helper'

describe Article do

  it "has a valid factory" do
    expect(build(:article)).to be_valid
  end

  it "is invalid without a title" do
    expect(build(:article, title: nil)).to have(1).errors_on(:title)
  end
  it "is invalid without a body" do
    expect(build(:article, body: nil)).to have(1).errors_on(:body)
  end
  it "is invalid without an author" do
    expect(build(:article, author: nil)).to have(1).errors_on(:author)
  end

  it "is invalid without a subcategory" do
    expect(build(:article, article_sub_category_id: nil)).to have(1).errors_on(:article_sub_category_id)
  end
end
