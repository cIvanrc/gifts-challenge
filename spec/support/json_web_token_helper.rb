module JsonWebTokenHelper
  def authorization_headers
    @authorization_headers ||= { 'Authorization' => "Bearer #{jwt}" }
  end

  def jwt
    @jwt ||= JsonWebToken.encode(sub: user.id)
  end

  def json
    response_body = JSON.parse(response.body)
    return response_body if response_body.class.name == 'Array'

    response_body.with_indifferent_access
  end
end
