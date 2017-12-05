class PagesController < ApplicationController
  skip_after_action :verify_authorized
  skip_before_action :authenticate_usuario!

  def sobre
  end
end
