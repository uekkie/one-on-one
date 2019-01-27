class QuestionBoardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board, only: %i(show edit update)

  def index
    @boards = current_user.question_boards.order(created_at: :desc)
  end

  def show
  end


  def edit
    @question = Question.new
  end


  def new
    @board = QuestionBoard.new
    @question = @board.questions.new
  end


  def create
    @board = current_user.question_boards.new(board_params)

    respond_to do |format|
      if @board.save
        format.html { redirect_to question_board_url(@board), notice: 'Board Created!'}
      else
        format.html { render :new }
      end
    end
  end

  def update
    @board.update!(board_params)
    redirect_to question_board_url(@board), notice: 'Board Updated!'
  end

  def destroy
  end

  private

  def board_params
    params.require(:question_board).permit(:title)
  end

  def set_board
    @board = current_user.question_boards.find(params[:id])
  end

end
