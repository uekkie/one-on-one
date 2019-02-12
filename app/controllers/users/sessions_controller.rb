# Deviseの機能でログアウトするので不要
class Users::SessionsController < ApplicationController
  def destroy
    reset_session
    redirect_to root_path
  end
end
