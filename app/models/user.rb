class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:site_admin], multiple: false)                                          ##
  ############################################################################################ 
 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :avatar, AvatarUploader
  has_many :blogs,dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :blog_comments, dependent: :destroy
  has_many :workexamples, dependent: :destroy
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, provideruserid: auth.uid).first_or_create do |user|
    user.provider = auth.provider
    user.provideruserid = auth.uid
    user.email = auth.info.email
    user.provideravatar = auth.info.image
    user.name = auth.info.first_name + ' ' + auth.info.last_name
    user.password = Devise.friendly_token[0,20]
    byebug
    end
  end


end
