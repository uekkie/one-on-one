class AnswerBoardsController < ApplicationController
  skip_before_action :authenticate_user!, except: %i(index show thanks)
  before_action :set_token, :set_invite, :set_questions, except: %i(index show thanks)
  before_action :check_answer, only: %i(new create)

  def index
    @boards = current_user.answer_boards.order(created_at: :desc)
  end

  def show
    @board = current_user.answer_boards.find(params[:id])
  end

  def new
    @answer_board = AnswerBoard.new

    @questions.each do |question|
      @answer_board.answers.build(question: question)
    end
  end

  def create
    @answer_board = current_user.answer_boards.create(invite: @invite)

    @questions.each do |question|
      answer = @answer_board.answers.build(
        question: question,
        content: params[:answer_board][:answers][question.id.to_s][:content]
      )
    end

    if @answer_board.save
      redirect_to thanks_answer_boards_url, notice: '回答が送信されました'
    else
      render :new, token: @token
    end
  end


  def thanks
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

  def check_answer
    if @invite.answer_board.present?
      redirect_to thanks_answer_boards_url, notice: 'すでに回答済みです'
    end
  end
end
