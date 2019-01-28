class Users::InvitesController < ApplicationController

  def index
    @invites = Invite.where(user_id: current_user).order(created_at: :desc)
  end

  def new
    @invite = Invite.new
  end
end
