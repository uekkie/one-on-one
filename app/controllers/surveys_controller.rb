class SurveysController < ApplicationController
  def show
    @token = params[:token]
    @invite = Invite.find_by(survey_token: @token)
  end
end
