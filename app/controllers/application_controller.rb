class ApplicationController < ActionController::Base
  before_action :add_params, if: :devise_controller?
  before_filter :authenticate_user!, except: :cities_select
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def add_params
    devise_parameter_sanitizer.for(:sign_up).push(:family_name, :first_name, :prefecture_id, :city_id, :avatar)
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def prefecture
    @prefecture_id = City.find(session[:id])
    render nothing: true
    bindingpry
  end
end
