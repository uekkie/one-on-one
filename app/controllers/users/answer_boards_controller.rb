class Users::AnswerBoardsController < ApplicationController
  before_action :authenticate_user!
  def index
    @boards = AnswerBoard.where(user:current_user).order(created_at: :desc)
  end

  def show
    @board = AnswerBoard.where(user:current_user).find(params[:id])
  end
end
