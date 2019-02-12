class QuestionBoards::InvitesController < ApplicationController
  before_action :set_question_board, only: %i(index new create)

  def index
    @invites = current_user.invites.order(created_at: :desc)
  end

  def new
    @invite = Invite.new
  end

  def create
    @invite = current_user.invites.build(invite_params)
    if @invite.save
      # deliver_nowでエラーが出た場合はハンドリングしてフォローする
      # エラーが出た場合は再送するなどのボタンが表示されるなど
      # メールサーバー側の問題も起こり得るが、ここではエラーが出る方が親切な気がする
      InviteMailer.creation_email(@invite).deliver_now
      redirect_to question_board_url(@invite.question_board), notice: "#{@invite.name}さんに回答依頼を送信しました。"
    else
      render :new
    end
  end

  private
  def set_question_board
    @question_board = current_user.question_boards.find(params[:question_board_id])
  end

  def invite_params
    params.require(:invite).permit(:name, :email, :question_board_id)
  end
end
