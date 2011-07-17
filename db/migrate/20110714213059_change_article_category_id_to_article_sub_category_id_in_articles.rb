class ChangeArticleCategoryIdToArticleSubCategoryIdInArticles < ActiveRecord::Migration
  def self.up
    rename_column :articles, :article_category_id, :article_sub_category_id
  end

  def self.down
    rename_column :articles, :article_sub_category_id, :article_category_id
  end
end
