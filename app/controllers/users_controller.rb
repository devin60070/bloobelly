class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render :new
    end
  end
  
  def show
    @user=User.find(params[:id])
    @shopping_trips=@user.shopping_trips
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shopping_trip }
    end
  
  end
end
