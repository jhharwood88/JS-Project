class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable

    validates :username, presence: true
    validates :username, uniqueness: true

    has_many :lists
    has_many :items, through: :lists

	def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	  	
	    user.email = auth.info.email
	    user.password = Devise.friendly_token[0, 20]
	    user.username = auth.info.nickname
	    user.provider = auth.provider
	    user.uid = auth.uid   # assuming the user model has a name
	    # If you are using confirmable and the provider(s) you use validate emails, 
	    # uncomment the line below to skip the confirmation emails.
	    # user.skip_confirmation!
	  end
	end

	# def self.new_with_session(params, session)
 #    super.tap do |user|
 #      if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"]
 #        user.email = data["email"] if user.email.blank?
 #      end
 #    end
 #  end

end

