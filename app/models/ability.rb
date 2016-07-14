#Ability.rb
#This file contains the settings for cancan, and hence manages what level of
#admin can access what parts of the site

class Ability

  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here.
    #If Sadmin or Admin we can access the admin system
    #Only the Sadmin can manage other admin
       if user.sadmin? or user.admin?
         can :access, :rails_admin
         can :dashboard
         can :manage, [Job]
         if user.sadmin?
            can :manage, :all
        end
       else
       end

  end
end
