class QuestionBoardsController < ApplicationController
  before_action :set_question_board, only: %i(show edit update)

  def index
    @boards = current_user.question_boards.order(created_at: :desc)
  end

  def show
  end

  def edit
  end

  def new
    @question_board = QuestionBoard.new
  end

  def create
    @question_board = current_user.question_boards.build(board_params)

    if @question_board.save
      redirect_to question_board_url(@question_board), notice: '作成しました'
    else
      render :new
    end
  end

  def update
    if @question_board.update(board_params)
      redirect_to question_board_url(@question_board), notice: '更新しました'
    else
      render :edit
    end
  end

  private

  def board_params
    params.require(:question_board).permit(:title)
  end

  def set_question_board
    @question_board = current_user.question_boards.find(params[:id])
  end
end
