class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    find_by(auth.slice("provider", "uid")) || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"] || auth["info"]["name"]
    end
  end
end
