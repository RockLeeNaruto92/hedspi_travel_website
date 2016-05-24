module ApplicationHelper
  def content_head content
    content
  end

  def get_booking_params params, param_name
    return params[:bookings][param_name] if params[:bookings].present?
  end
end
