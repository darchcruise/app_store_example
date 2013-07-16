class AppsController < ApplicationController
  # GET /apps
  def index
    @apps = App.all
      if params[:user_id]
        @apps = User.find(params[:user_id]).apps
      else
        @apps = App.all
      end
  end

  # GET /apps/1
  def show
  # SELECT * FROM apps WHERE id = params[:id]
    @app = App.find(params[:id])
  # SELECT * FROM users
    @users = User.all
  end

#PUT /apps/:id/buy
  def buy
    # application id
    app = App.find(params[:id])
    # user id
    user = User.find(params[:app][:users])

    # Apps have transactions
    app.transactions.create(user: user)

    redirect_to app, notice: "App purchased by #{user.name}"
  end


end
