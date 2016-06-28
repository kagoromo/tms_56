class RelationshipsController < ApplicationController 
  load_and_authorize_resource :user, only: [:index]
  
  def index
    @title = params[:action_type]
    @users = @user.send(params[:action_type]).page params[:page]
  end

  def create
    @user = User.find params[:followed_id]
    current_user.follow @user
    respond_to do |format|
      format.html{redirect_to @user}
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow @user
    respond_to do |format|
      format.html{redirect_to @user}
      format.js
    end
  end
end
