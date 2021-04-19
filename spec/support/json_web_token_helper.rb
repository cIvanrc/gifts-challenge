module JsonWebTokenHelper
  def authorization_headers
    @authorization_headers ||= { 'Authorization' => "Bearer #{jwt}" }
  end

  def jwt
    @jwt ||= JsonWebToken.encode(sub: user.id)
  end

  def json
    JSON.parse(response.body).with_indifferent_access
  end
end
