class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :load_article_sub_categories, :load_scout_teams, :calendar_events_list
  
  
  def load_scout_teams
    @scout_teams = ScoutTeam.all
  end
  
  def load_article_categories
    @article_categories = ArticleCategory.all
  end
  
  def load_article_sub_categories
    @article_sub_categories = ArticleSubCategory.all
  end
  
  def calendar_events_list
    @all_calendar_events = CalendarEvent.all(:limit => 3, :order => "id DESC")
  end
end
