class HomesController < ApplicationController
  def index
    if user_signed_in?
      redirect_to user_question_boards_url(current_user)
    end
  end
end
