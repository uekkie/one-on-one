class AnswerBoardsController < ApplicationController
  def index
    @boards = AnswerBoard.all
  end

  def new
    @token = params[:token]
    invite = Invite.find_by(token: @token)

    @answer_board = AnswerBoard.new
    
    invite.question_board.questions.each do |question|
      @answer_board.answers.new(question: question)
    end
  end

  def create
    @token = params[:answer_board][:token]
    invite = Invite.find_by(token: @token)


    @answer_board = AnswerBoard.new(
      user: invite.user,
      invite: invite
    )
    
    @answer_board.answers.build(answer_board_params)
    if @answer_board.save
      redirect_to answer_boards_url, notice: '回答しました'
    else
      render :new
    end
  end

  private

  def answer_board_params
    params.require(:answer_board).permit(answers_attributes: [:content, :question_id])
  end
end
