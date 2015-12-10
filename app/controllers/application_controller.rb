require 'application_responder'

# Родительский контроллер приложения.
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  self.responder = ApplicationResponder
  respond_to :html

  rescue_from CanCan::AccessDenied, with: :access_denied

  before_filter :append_view_paths

  private

  def access_denied
    return if redirect_to root_path, alert: 'Доступ запрещён.'
  end

  def append_view_paths
    append_view_path 'app/views/shared'
  end
end
