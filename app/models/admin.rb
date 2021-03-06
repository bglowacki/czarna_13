class Admin < ActiveRecord::Base
  
  has_many :recent_events
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable,  :recoverable, , :confirmable
  devise :database_authenticatable, :registerable,
          :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me
end
