class User < ApplicationRecord
    has_many :events 
    has_many :tasks, through: :events
    has_secure_password 
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :password, presence: true

    # def self.from_omniauth(auth)
    #     where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
    #       user.provider = auth.provider
    #       user.uid = auth.uid
    #       user.name = auth.info.name
    #       user.oauth_token = auth.credentials.token
    #       user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    #       user.save!
    #     end
    #   end

      def self.find_or_create_by_omniauth(auth_hash)
        self.where(:username => auth_hash["info"]["first_name"]).first_or_create do |user|
            user.provider = auth_hash.provider
            user.password = SecureRandom.hex
            user.uid = auth_hash.uid
            user.name = auth_hash.info.name
            user.oauth_token = auth_hash.credentials.token
            user.oauth_expires_at = Time.at(auth_hash.credentials.expires_at)
            user.save!
        end
      end


  

      
    


end
