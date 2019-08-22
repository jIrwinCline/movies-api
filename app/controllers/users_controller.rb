class UsersController < ApplicationController

  def create

    @user = User.new(:username => params[:username], :password => params[:password])
    if @user.save!
      token = Token.generate
      json_response({:message=>"User created", :username=>@user.username, :password=>@user.password, :token=>token.token_hash}, 201)
    else
      json_response(:message=>"Sorry! Try again.")
    end
  end

  def new
    json_response({:message => "Send a post request to /register to sign up!", :username=>"", :password=>""})
  end

end
