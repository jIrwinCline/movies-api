class ApplicationController < ActionController::API
  include Response

  rescue_from ActiveRecord::RecordNotFound do |e|
    json_response({message: e.message}, 404)
  end
  rescue_from  ActiveRecord::RecordInvalid do |e|
    json_response({message: e.message}, 400)
  end
end
