class SessionsController < ApplicationController

  def login
    json_response({:message => "Please Log In! Via Post Request to /login", :url => "localhost:3000/login"})
  end

  def create
    if params[:username] && params[:password]
        authenticate_result = User.authenticate(params[:username], params[:password])
        json_response(authenticate_result)
    end
  end
end
