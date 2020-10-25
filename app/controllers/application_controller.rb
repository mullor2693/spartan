class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!

    # Override devise's after_sign_in_path_for
    def after_sign_in_path_for(resource)
        if resource.has_role? :admin
            admin_authenticated_root_path
        else
            authenticated_root_path
        end
    end
end
