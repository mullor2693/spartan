class Admin::ApplicationController < ApplicationController
    before_action :authenticate_admin

    private

    def authenticate_admin
        unless current_user.present? && current_user.has_role?(:admin)
            flash[:alert] = "No tiene permiso para acceder al panel de administración."
            redirect_to (current_user.present? ? authenticated_root_path : root_path)
        end
    end
        
end
