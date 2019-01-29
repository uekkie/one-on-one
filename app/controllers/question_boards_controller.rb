class QuestionBoardsController < ApplicationController
  # ApplicationControllerに入れる
  before_action :authenticate_user!
  before_action :set_question_board, only: %i(show edit update)

  def index
    @boards = current_user.question_boards.order(created_at: :desc)
  end

  def show
  end

  def edit
    # nested_formでも書ける可能性がある
    @question = Question.new
  end


  def new
    @question_board = QuestionBoard.new
    # questions_controller.rbの方で作っているのでいらないかもしれない
    @question = Question.new
  end


  def create
    # 関連から作る時はbuildで統一する
    @question_board = current_user.question_boards.new(board_params)
    # modelでcreate_before or after(save)でquestion引っ張ってきて入れる
    # マスターデータを用意する（仕様による）
    @question_board.questions = Question.where(id: 1..4)

    # respond_to do |format|
      if @question_board.save
        # format.html do
          redirect_to question_board_url(@question_board), notice: '作成しました'
        end
      else
        # format.html do
          render :new
        end
      end
    end
  end

  def update
    # validationで失敗したらrenderする
    @question_board.update!(board_params)
    redirect_to question_board_url(@question_board), notice: '更新しました'
  end

  # 実装してない場合は削除しておく
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
