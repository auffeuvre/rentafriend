class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def create

  end

  def edit

  end

  def update
  end

  def myprofile
  end



end
