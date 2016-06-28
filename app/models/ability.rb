class Ability
  include CanCan::Ability

  def initialize user, namespace
    user ||= User.new
    alias_action :new, :create, :edit, :update, :destroy, to: :crud

    if user.supervisor?
      can :manage, :all
      cannot :crud, User do |other_user|
        user == other_user
      end
    else
      if namespace == "supervisor"
        cannot :manage, :all
      else
        can :read, Course
        can :read, Subject
        can :read, UserCourse, user_id: user.id
        can :read, User do |other_user|
          other_user.trainee?
        end
        can :manage, TraineeSubject, user_id: user.id
        can :manage, TraineeTask, user_id: user.id
      end
    end
  end
end
