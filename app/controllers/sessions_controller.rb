class SessionsController < ApplicationController

  def login
    json_response({:message => "Please Log In! Via Post Request to /login", :url => "http://localhost:3000/login", :username => "", :password => ""})
  end

  def create
    if request.headers["HTTP_USERNAME"] && request.headers["HTTP_PASSWORD"]
        authenticate_result = User.authenticate(request.headers["HTTP_USERNAME"], request.headers["HTTP_PASSWORD"])
        json_response(authenticate_result)
    end
  end
end
