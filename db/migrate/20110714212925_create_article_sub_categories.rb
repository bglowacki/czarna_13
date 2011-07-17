class CreateArticleSubCategories < ActiveRecord::Migration
  def self.up
    create_table :article_sub_categories do |t|
      t.string :name
      t.text :body
      t.integer :article_category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :article_sub_categories
  end
end
