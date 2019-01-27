class HomesController < ApplicationController
  def index
    if user_signed_in?
      redirect_to question_boards_url
    end
  end
end
