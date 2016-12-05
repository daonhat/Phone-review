class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable

  has_many :phones, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_attached_file :avatar, styles: {medium: "300x300>", thumb: "100x100>"},
    default_url: "avatar/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_attachment :avatar,
    content_type: {content_type: ["image/jpeg", "image/jpg", "image/png", "image/gif"]},
    size: {in: 0..2048.kilobytes}
  validates :email, presence: true, length: {maximum: 235},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :name, length: {maximum: 50}
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true

  enum gender: ["male", "female", "trans"]


  class << self
    def from_omniauth auth
      find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name
        #user.avatar = auth.info.image
      end
    end

    def new_with_session params, session
      super.tap do |user|
        if data = session["devise.#{user.provider}_data"] &&
          session["devise.#{user.provider}_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end
  end
end
