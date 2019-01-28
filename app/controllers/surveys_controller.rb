class SurveysController < ApplicationController
  def show
    @token = params[:token]
    @invite = Invite.find_by(token: @token)
  end
end
