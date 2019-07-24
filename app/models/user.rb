class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include HTTParty
  base_uri 'https://graph.microsoft.com/v1.0' 

  devise :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

  has_person_name

  has_many :notifications, foreign_key: :recipient_id
  has_many :services
  

  def access_token
    services.first.access_token
  end

  def client_options
    return {
      headers: {
        "Authorization": "Bearer #{access_token}"
      }
    }
  end

  def profile
    request = self.class.get("/me?$select=proxyAddresses,accountEnabled,createdDateTime,givenName,surname,id,mail,userPrincipalName", client_options)
    JSON.parse(request.body)
  end


end
