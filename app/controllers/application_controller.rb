class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  before_action :authenticate_usuario!
  after_action :verify_authorized, unless: :devise_controller?

  def pundit_user
    current_usuario
  end

end
