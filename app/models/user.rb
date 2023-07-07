class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

         has_many :recipes
         has_many :likes
         has_many :sns_credentials
         validates :nickname, presence: true
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates :password, format: { with: VALID_PASSWORD_REGEX }
         with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
         validates :surname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/}
         validates :name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/}
         end
         validates :katakana_surname, presence: true, format: { with: /\A[\p{Katakana}\p{Space}ー－]+\z/}
         validates :katakana_name, presence: true, format: { with: /\A[\p{Katakana}\p{Space}ー－]+\z/}
         validates :birth, presence: true

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
