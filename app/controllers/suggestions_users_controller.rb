# app/controllers/author_books_controller.rb
class SuggestionsUsersController < ApplicationController
  def index
    @suggestions = Suggestions.all
  end
  
  def new
  end
  
  def edit
    @suggestions = Suggestions.find(params[:id])
  end
  
  def create
    username = params[:suggestion][:username]
    name = params[:suggestion][:name]
    division = params[:suggestion][:division]
    department = params[:suggestion][:department]
    password = params[:suggestion][:password]
    first_name = params[:suggestion][:first_name]
    last_name = params[:suggestion][:last_name]
    suggestion = params[:suggestions][:suggestion]
    conn = ActiveRecord::Base.connection
    sql = "insert into suggestions_users_view (username,name,division,department,password,first_name,last_name,suggestion) 
      values ('" + username + "','" + name + "','" + division + "','" + department + "','" + password + 
      "','" + first_name + "','" + last_name + "','" + suggestion + "')"
    conn.insert(sql)
    redirect_to :controller => "suggestions_users", :action => "index"
  end
  
  def chooseSuggestion
    @suggestions = Suggestions.all
  end

  def findBySuggestion
    @suggestionsusers = SuggestionsUsers.find_all_by_suggestion(params[:suggestion])
  end
end
