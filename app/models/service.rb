class Service < ApplicationRecord
  belongs_to :user

  Devise.omniauth_configs.keys.each do |provider|
    scope provider, ->{ where(provider: provider) }
  end

  def client
    send("#{provider}_client")
  end

  def expired?
    expires_at? && expires_at <= Time.zone.now
  end

  def access_token
    send("#{provider}_refresh_token!", super) if expired?
    super
  end


  def azure_oauth2_refresh_token!(token)
    srv = Service.find_by(access_token: token)
    refresh_token = srv.refresh_token
    req = HTTParty.post('https://login.microsoftonline.com/58c337da-d148-4281-ab03-0e91bff6825e/oauth2/v2.0/token', {
      body: {
        client_id: Rails.application.credentials[:office][:client_id],
        refresh_token: refresh_token,
        grant_type: 'refresh_token',
        resource: 'https://graph.microsoft.com',
        client_secret: Rails.application.credentials[:office][:secret]
      }
    })
    srv.update(access_token: JSON.parse(req.body)["access_token"])
  end
end
