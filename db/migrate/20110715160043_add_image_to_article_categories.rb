class AddImageToArticleCategories < ActiveRecord::Migration
  def self.up
    add_column :article_categories, :image, :string
  end

  def self.down
    remove_column :article_categories, :image
  end
end
