class InvitesController < ApplicationController
  def create
    myself = current_user
    invitee = User.find(params[:id])
    newinvite = Invite.new(user: myself, contact: invitee)

    if newinvite.save
      return redirect_to :back
    end
  end

  def destroy
    user = current_user
    invitee = User.find(params[:id])

    request = Invite.find_by(contact: invitee, user: user)

		request.destroy

		return redirect_to :back

	end
end
