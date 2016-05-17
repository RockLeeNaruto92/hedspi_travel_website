class Admin::SessionsController < ApplicationController
  layout "login"
  before_action :require_not_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to admin_root_path
    else
      flash.now[:danger] = I18n.t("admin.login.errors")
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private
  def require_not_login
    # redirect_to admin_root_path if logged_in?
  end
end
