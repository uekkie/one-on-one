class AnswerBoardsController < ApplicationController
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


    @answer_board = AnswerBoard.create(
      user: invite.user,
      invite: invite
    )
    invite.question_board.questions.each do |question|
      answer = @answer_board.answers.build(
        question: question,
        content: params[:answer_board][:answers][question.id.to_s][:content]
      )
      answer.save
    end
    if @answer_board.save
      redirect_to answer_boards_url, notice: '回答しました'
    else
      render :new
    end
  end

end
