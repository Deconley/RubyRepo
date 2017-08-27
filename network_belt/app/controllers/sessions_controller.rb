class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(params[:email])
    p @user
    if @user.try(:authenticate, params[:password])
      session[:user_id] = @user.id
      return redirect_to "/networks/#{@user.id}"
      #  return redirect_to action: "show", :controller => "users", id: @user.id
    end
    flash[:errors] = ["Invalid account credentials"]
    return redirect_to :back
  end

  def destroy
    session.clear

    return redirect_to root_path
  end
end
