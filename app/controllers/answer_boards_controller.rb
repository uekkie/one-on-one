class AnswerBoardsController < ApplicationController
  before_action :set_token, :set_invite, :set_questions, except: %i(index show)
  before_action :authenticate_user!, only: %i(index show)

  def index
    @boards = current_user.answer_boards.order(created_at: :desc)
  end

  def show
    @board = current_user.answer_boards.find(params[:id])
  end

  def new
    if AnswerBoard.where(invite: @invite).count > 0
      redirect_to thanks_url, notice: 'すでに回答済みです'
    end

    @answer_board = AnswerBoard.new

    @questions.each do |question|
      @answer_board.answers.new(question: question)
    end
  end

  def create
    @answer_board = @invite.user.answer_boards.create(
      invite: @invite
    )
    @questions.each do |question|
      answer = @answer_board.answers.build(
        question: question,
        content: params[:answer_board][:answers][question.id.to_s][:content]
      )
      answer.save
    end

    if @answer_board.save
      redirect_to thanks_url, notice: '回答が送信されました'
    else
      render :new, token: @token
    end
  end

  private
  def set_token
    @token = params[:token] || params[:answer_board][:token]
  end

  def set_invite
    @invite = Invite.find_by(token: @token)
  end

  def set_questions
    @questions = @invite.question_board.questions
  end
end
