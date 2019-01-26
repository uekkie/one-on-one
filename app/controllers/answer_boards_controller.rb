class AnswerBoardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @boards = current_user.answer_boards.order(created_at: :desc)
    # @board = current_user.answer
  end

  def show
  end
end
