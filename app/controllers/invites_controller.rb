class Users::InvitesController < ApplicationController

  def index
    @invites = Invite.where(user_id: current_user)
  end

  def new
    @invite = Invite.new
  end
end
