class Supervisor::UsersController < ApplicationController
  load_and_authorize_resource
  before_action :get_role_type, only: [:new, :edit]

  def index
    @users = @users.trainee.page params[:page]
  end

  def new
  end

  def create
    if @user.save
      flash[:success] = t "message.new_user_successful"
      redirect_to supervisor_users_path
    else
      get_role_type
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "message.edit_trainee_success"
      redirect_to supervisor_users_path
    else
      get_role_type
      flash[:danger] = t "message.edit_trainee_unsuccess"
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "message.delete_trainee_success"
    else
      flash[:danger] = t "message.delete_trainee_unsuccess"
    end
    redirect_to supervisor_users_path
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :role,
      :password, :password_confirmation
  end

  def get_role_type
    @role_type = User.roles
  end
end
