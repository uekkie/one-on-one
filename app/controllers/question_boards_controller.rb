class QuestionBoardsController < ApplicationController
  before_action :set_question_board, only: %i(show edit update)

  def index
    @boards = current_user.question_boards.order(created_at: :desc)
  end

  def show
  end

  def edit
    @question = Question.new
  end


  def new
    @question_board = QuestionBoard.new
    @question = Question.new
  end


  def create
    @question_board = current_user.question_boards.new(board_params)
    
    @question_board.questions = Question.where(id: 1..4)

    respond_to do |format|
      if @question_board.save
        format.html { redirect_to question_board_url(@question_board), notice: '作成しました'}
      else
        format.html { render :new }
      end
    end
  end

  def update
    @question_board.update!(board_params)
    redirect_to question_board_url(@question_board), notice: '更新しました'
  end

  def destroy
  end

  private

  def board_params
    params.require(:question_board).permit(:title)
  end

  def set_question_board
    @question_board = current_user.question_boards.find(params[:id])
  end
end
