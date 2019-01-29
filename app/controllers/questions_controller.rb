class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board, only: %i(show create)

  def index
  end

  # 削除する（viewも削除）
  def show
  end


  def new
    @question = Question.new
  end

  def create
    @question = @board.questions.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to question_board_url(@board), notice: 'Question Created!'}
      else
        format.html { render :new }
      end
    end
  end

  # 削除する
  def update

  end

  private

  def question_params
    params.require(:question).permit(:title)
  end

  # quistion_board/application_controller.rb（module）の中でset_boardを行う
  # set_question_boardがいいかも
  def set_board
    @board = current_user.question_boards.find(params[:question_board_id])
  end
end
