class UsersController < ApplicationController
  def index
    @users = User.where(user: !current_user)
  end

  def create
    user = User.new(user_params)
    p user
    if user.save #this has to be there to save the user
      flash[:notice] = ["Registered successfully"]
      session[:user_id] = user.id
      return redirect_to "/networks/#{user.id}"
    end
    errors = user.errors.full_messages
    flash[:errors] = errors
    return redirect_to '/'
  end

  def show
    @user = current_user
    @users = User.where.not(id: @user.id).where.not(id: @user.friend_ids).where.not(id: @user.friended_by_ids)
    # @users = User.where.not(id: @user.id)
    @invitee = Invite.where(invitee: current_user)
  end

  def description
    @user = User.find(params[:id])
    p @user


  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :description)
  end
end
