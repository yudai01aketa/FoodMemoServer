module JwtAuthenticator
  SECRET_KEY = Rails.application.secrets.secret_key_base

  # ヘッダーの認証トークンを復号化してユーザー認証を行う
  def jwt_authenticate
    raise I18n.t("message.authorization") if request.headers['Authorization'].blank?
    encoded_token = request.headers['Authorization'].split('Bearer ').last
    @current_user = User.find_by(id: decode(encoded_token)['user_id'])
    raise I18n.t("message.authorization") if @current_user.blank?
    @current_user
  end

  # 暗号化処理
  def encode(user_id)
    expires_in = 1.month.from_now.to_i
    preload = { user_id: user_id, exp: expires_in }
    JWT.encode(preload, SECRET_KEY, 'HS256')
  end

  # 復号化処理
  def decode(encoded_token)
    JWT.decode(encoded_token, SECRET_KEY, false, algorithm: 'HS256').first
  end
end
