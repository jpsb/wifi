class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  def self.from_omniauth(auth)
    imagem = auth.info.image.gsub('http://','https://')
    user_find = where(Usuario.arel_table[:email].eq(auth.info.email).and(Usuario.arel_table[:provider].not_eq(auth.provider).or(Usuario.arel_table[:provider].eq(nil)))).first
    if user_find
      user_find.name = auth.info.name
      user_find.provider = auth.provider
      user_find.uid = auth.uid
      user_find.save
    else
      user_find = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name   # assuming the user model has a name
      end
    end
    user_find.save
    user_find
  end

end
