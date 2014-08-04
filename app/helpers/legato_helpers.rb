module LegatoHelpers
  def service_account_user(scope="https://www.googleapis.com/auth/analytics.readonly")
   client = Google::APIClient.new(
     :application_name => "Dummy App",
     :application_version => "0.1"
     )
   key = Google::APIClient::PKCS12.load_key("client.p12", "notasecret")
   service_account = Google::APIClient::JWTAsserter.new("18823262807-b2908btksh076kt38ognrhgioht3f70i@developer.gserviceaccount.com", scope, key)
   client.authorization = service_account.authorize
   oauth_client = OAuth2::Client.new("", "", {
    :authorize_url => 'https://accounts.google.com/o/oauth2/auth',
    :token_url => 'https://accounts.google.com/o/oauth2/token'
    })
   token = OAuth2::AccessToken.new(oauth_client, client.authorization.access_token)
   Legato::User.new(token)
 end
end