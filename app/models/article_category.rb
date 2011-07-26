class ArticleCategory < ActiveRecord::Base
  has_many :article_sub_categories, :dependent => :destroy
end
