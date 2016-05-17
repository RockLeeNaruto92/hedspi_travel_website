class Admin::BaseController < ApplicationController
  layout "admin"
  before_action :require_login

  def set_image_description params
    params[:images].each do |image|
      @image = Image.find image[0]
      @image.description = image[1]["description"]
      @image.save
    end
  end

  private
  def require_login
    redirect_to admin_login_path unless logged_in?
  end
end
