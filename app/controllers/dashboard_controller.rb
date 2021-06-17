class DashboardController < ApplicationController
  protect_from_forgery with: :exception
  before_action :verify_jwt_token

  def index
    @constructions = current_user.company.constructions.where(is_active: true)
  end
  
  def dashboard_v1
    @constructions = current_user.company.constructions.where(is_active: true)
  end

  def dashboard_v2
  end

  def dashboard_v3
  end
  
end
