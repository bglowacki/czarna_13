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

  factory :gallery do
    name "New Gallery"
    description "Best pictures ever"
    picassa_address "http://www.picassa.org"
    image_file_name "gallery.gif"
    image_content_type "gif"
    image_file_size 120
    image_updated_at Time.now
  end

  factory :idea do
    title "New Idea"
    description "This is a description for an idea"
    added_by "Bartek"
  end

  factory :recent_event do
    title "New Recent Event"
    description "Description of a new recent event"
    admin_id 1
  end
end