FactoryGirl.define do
  factory :article_category do
    name "Article Category"
    description "This is the category"
    image "/image/string/"
  end

  factory :article_sub_category do
    name "Subcategory"
    body "Subcategory for the articles"
    article_category_id :article_category
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
    sequence(:email) {|n| "example#{n}@user.com"}
    password "xxxxxx"
    password_confirmation "xxxxxx"
  end

  factory :calendar_event do
    title "New Event"
    from Date.today
    to Date.today + 1.weeks
    note "Event will be held there"
  end
end