##############################################################################
#user.rb
#This is the model file for the user model
#Currently default of what Devise generated
##############################################################################

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
