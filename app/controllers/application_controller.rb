class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404
  # rescue_from Exception, with: :render_500

  def after_sign_in_path_for(resource)
    posts_path
  end

  def set_search
    @search = Post.ransack(params[:q])

    @items = @search.result
  end

  def raise_not_found!
    raise ActionController::RoutingError, "No route matches #{params[:unmatched_route]}"
  end

  def render_404
    render template: 'errors/error_404', status: :not_found, layout: 'application', content_type: 'text/html'
  end

  def render_500
    render template: 'errors/error_500', status: :internal_server_error, layout: 'application', content_type: 'text/html'
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
