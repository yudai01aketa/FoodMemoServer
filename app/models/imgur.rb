class Imgur
  URL = Settings.Imgur.url
  URL.freeze

  def self.upload(image_data)
    auth_header = { 'Authorization' => "Client-ID #{ENV['IMGUR_CLIENT_ID']}" }
    http_client = HTTPClient.new
    body = { 'image' => image_data }
    response = http_client.post(URI.parse(URL), body, auth_header)
    # Base64コードで保存した文字列をimgur画像pathに変換
    result_hash = JSON.load(response.body)
    raise I18n.t("message.invalid_imgur") unless result_hash['data']['link']
    result_hash['data']['link']
  end
end

