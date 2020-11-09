class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!
    before_action :set_current_user
    # add_breadcrumb '<span uk-icon="home"></span>'.html_safe, :authenticated_root_path
    add_breadcrumb "Home", :authenticated_root_path

    def set_current_user
        @current_user = User.with_attached_avatar.find_by(id: current_user&.id) if current_user.present?
    end
    
    # Override devise's after_sign_in_path_for
    def after_sign_in_path_for(resource)
        authenticated_root_path
    end
end
