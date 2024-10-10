# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    
    if user.admin?
      load_for_admin
    elsif user.normal_user?
      load_for_normal_user
    elsif user.user?
      load_for_user
    end
  end

  def load_for_admin
    can :manage, :all
  end

  def load_for_normal_user
    
  end
  
  def load_for_user
     
  end
end
