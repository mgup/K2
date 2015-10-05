require 'application_responder'

# Родительский контроллер приложения.
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  self.responder = ApplicationResponder
  respond_to :html

  rescue_from 'Acl9::AccessDenied', with: :access_denied

  private

  def access_denied
    redirect_to root_path, alert: 'Доступ запрещён.'
  end
end
