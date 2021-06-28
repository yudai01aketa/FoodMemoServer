class Api::V1::UsersController < ApplicationController
  def sign_up
    user = User.new(user_params)
    if user.save
      render_json_jwt_success(encode(user.id))
    else
      render_json_jwt_invalid(I18n.t("message.invalid_sign_up"))
    end
  end

  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      render_json_jwt_success(encode(user.id))
    else
      render_json_jwt_error
    end
  end

  private

    def user_params
      params.permit(:email, :password)
    end
end
