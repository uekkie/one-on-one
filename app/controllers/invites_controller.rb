class InvitesController < ApplicationController

  def new
    @user = current_user
    @board = current_user.question_boards.find(params[:question_board_id])
    @invite = Invite.new
  end

  def create
    member = Member.find_or_create_by!(member_params)
    @invite = current_user.invites.build(
      question_board_id: params[:question_board_id],
      member: member
    )

    if @invite.save
      InviteMailer.creation_email(@invite).deliver_now
      redirect_to user_question_board_url(@invite.user, @invite.question_board), notice: "回答依頼を送信しました。"
    else
      render :new
    end
  end

  private
  def member_params
    params.require(:invite).permit(:name, :email)
  end
end
