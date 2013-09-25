require 'spec_helper'

describe ArticleCategory do

  let(:article_category) {create(:article_category)}
  subject {article_category}

  it {should be_valid}
  it {should respond_to(:name)}
  it {should respond_to(:description)}
  it {should respond_to(:image)}
  it {should respond_to(:article_sub_categories)}

  it "should not be valid without name" do
    article_category.name = nil
    expect(article_category).not_to be_valid
  end

  it "should not be valid without description" do
    article_category.description = nil
    expect(article_category).not_to be_valid
  end

  it "should not be valid without image" do
    article_category.image = nil
    expect(article_category).not_to be_valid
  end

end
