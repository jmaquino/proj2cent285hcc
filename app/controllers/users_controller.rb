class UsersController < ApplicationController
  def new
  end
  
  def create
    name = params[:user][:name]
    division = params[:user][:division]
    department = params[:user][:department]
    username = params[:user][:username]
    password = params[:user][:password]
    conn = ActiveRecord::Base.connection
    sql = "insert into users_view (name,division,department,username,password) " +
      "values ('" + name + "','" + division + "','" + department + "','"+ username + "','" +
      password + "')"
    conn.insert(sql)
    redirect_to :controller => "users", :action => "index"
  end

  def edit
    @users = Users.find(params[:id])
  end
  
  def index
    @users = Users.all
  end
  
  def chooseUser
    @users = Users.all
  end
  
  def update
    @users = Users.find(params[:users][:id])
    if @users.update_attributes(:name => params[:users][:name], :division => params[:users][:division], :department => params[:users][:department], 
      :username => params[:users][:username])
      redirect_to :controller => "users", :action => "index"
    else
      render :action => "edit"
    end
  end

end
