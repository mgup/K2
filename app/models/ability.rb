# Модель, упралвяющая правами доступа назначений (Hr::Position).
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    return unless user.employee.present?

    employee = user.employee

    employee.positions.each do |position|
      can :manage, :all if position.has_role?(:developer)
    end

    obschiy_otdel if employee.works_in?(Department.find_by(id: 40))

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

  def obschiy_otdel
    can :manage, Office::Order
  end
end
