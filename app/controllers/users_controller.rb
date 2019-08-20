class UsersController < ApplicationController

  def create

  @user = User.new(:username => "admin", :password => "password")
  @user.save!
  end

end
