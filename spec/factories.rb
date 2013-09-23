FactoryGirl.define do

  factory :article_sub_category do
    name "Subcategory"
    body "Subcategory for the articles"
  end

  factory :article do
    title "New article"
    body "This is the newest article"
    author "Bartek"
    article_sub_category_id :article_sub_category
  end

  factory :admin do
    first_name "Bartek"
    last_name "Glowacki"
    email "example@user.com"
    password "xxxxxx"
    password_confirmation "xxxxxx"
  end
end