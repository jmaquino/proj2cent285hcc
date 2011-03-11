# app/controllers/pages_controller.rb
class PagesController < ApplicationController
  def login
    if params[:users] == nil
      username = password = ""
    else
      username = params[:users][:username]
      password = params[:users][:password]
    end
    conn = ActiveRecord::Base.connection
    user_id = conn.select_value("select get_id('" + username +
      "','" + password + "')").to_i
    user = conn.select_one("select * from users where id=" + user_id.to_s + "")
    if user_id > 0
      cookies.signed[:DivAdmin] = false
      cookies.signed[:user_id] = user_id
      cookies.signed[:user_dep] = user['department']
      cookies.signed[:authenticated] = true
      if cookies.signed[:user_dep] == "Admin"
        cookies.signed[:DivAdmin] = true
      end
      redirect_to :controller => "pages", :action => "continue"
    end
  end
  
  def logout
    
  end

end
