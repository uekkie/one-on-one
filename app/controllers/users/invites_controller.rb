class Users::InvitesController < ApplicationController

  def index
    @invites = Invite.where(user_id: current_user)
  end

  def new
    @user = current_user
    @board = current_user.question_boards.find(params[:question_board_id])
    @invite = Invite.new
  end
end
