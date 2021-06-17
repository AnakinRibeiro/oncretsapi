# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role_id == 1
      # ADMIN
      can :read, User
      can :create, User
      can :update, User
      can :delete, User

      can :read, Construction
      can :create, Construction
      can :update, Construction
      can :delete, Construction

      can :read, Jack
      can :create, Jack
      can :update, Jack
      can :delete, Jack

      can :read, Pump
      can :create, Pump
      can :update, Pump
      can :delete, Pump

      can :read, Project
      can :create, Project
      can :update, Project
      can :delete, Project

      can :read, Spreadsheet
      can :create, Spreadsheet
      can :update, Spreadsheet
      can :delete, Spreadsheet

      can :read, Elongation
      can :create, Elongation
      can :update, Elongation
      can :delete, Elongation
    elsif user.role_id == 2
      # EMPLOYEE
      can :read, User
      cannot :create, User
      cannot :update, User
      cannot :delete, User

      can :read, Construction
      can :create, Construction
      can :update, Construction
      cannot :delete, Construction

      can :read, Jack
      can :create, Jack
      can :update, Jack
      cannot :delete, Jack

      can :read, Pump
      can :create, Pump
      can :update, Pump
      cannot :delete, Pump

      can :read, Project
      can :create, Project
      can :update, Project
      cannot :delete, Project

      can :read, Spreadsheet
      can :create, Spreadsheet
      can :update, Spreadsheet
      cannot :delete, Spreadsheet

      can :read, Elongation
      can :create, Elongation
      can :update, Elongation
      cannot :delete, Elongation
    elsif user.role_id == 3
      # Calculating
      cannot :read, User
      cannot :create, User
      cannot :update, User
      cannot :delete, User

      cannot :read, Construction
      cannot :create, Construction
      cannot :update, Construction
      cannot :delete, Construction

      cannot :read, Jack
      cannot :create, Jack
      cannot :update, Jack
      cannot :delete, Jack

      cannot :read, Pump
      cannot :create, Pump
      cannot :update, Pump
      cannot :delete, Pump

      cannot :read, Project
      can :create, Project
      can :update, Project
      can :delete, Project

      can :read, Spreadsheet
      cannot :create, Spreadsheet
      cannot :update, Spreadsheet
      cannot :delete, Spreadsheet

      can :read, Elongation
      can :create, Elongation
      can :update, Elongation
      cannot :delete, Elongation

    end

    cannot :read, 'Reports'

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
