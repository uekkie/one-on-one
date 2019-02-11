class AnswerBoardsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i(new create)

  before_action :set_token, :set_invite, :set_questions, :check_answer, only: %i(new create)

  def index
    @boards = current_user.answer_boards.order(created_at: :desc)
  end

  def show
    @board = current_user.answer_boards.find(params[:id])
  end

  def new
    answers ||= []
    @invite.question_board.questions.each do |question|
      answers.push(Answer.new(question: question))
    end

    @answer_board = AnswerInputForm.new(invite: @invite, answers: answers)
  end

  def create
    @answer_board = AnswerInputForm.new({invite: @invite}.merge(answer_input_params))

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

  def answer_input_params
    params.require(:answer_board).permit(answers_attributes: [:content, :question_id])
  end
end
