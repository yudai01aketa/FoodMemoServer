class ApplicationController < ActionController::API
  include JwtAuthenticator
  rescue_from RuntimeError, with: :authorization_error

  def render_json_foods(food)
    render json: food, status: 200
  end

  def render_json_result(status, food)
    render json: food, status: status
  end

  def render_json_delete(status, message)
    render json: { message: message }, status: status
  end

  def render_json_jwt_success(jwt)
    render json: { jwt: jwt }, status: 200
  end

  def render_json_jwt_invalid(jwt)
    render json: { jwt: jwt }, status: 401
  end

  def authorization_error(jwt_error)
    render json: { message: jwt_error.message }, status: 401
  end

  def render_json_jwt_error
    render json: { message: I18n.t("message.invalid_authorization") }, status: 401
  end
end
