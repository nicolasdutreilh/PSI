class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def restrict_to_admin
    unless current_user.present? && current_user.admin?
      render file: Rails.root.join('public','404.html'), status: 404, layout: false
    end
  end
end
