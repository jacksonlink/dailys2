class ApplicationController < ActionController::Base
    include Pundit
    before_action :configure_permitted_parameters, if: :devise_controller?

    #def configure_permitted_parameters
    #    devise_parameter_sanitizer.permit(:sign_up, keys: [:team_id])
    #    devise_parameter_sanitizer.permit(:account_update, keys: [:team_id])
    #end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:role, :team_id, :email, :password)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:role, :team_id, :email, :password, :current_password)}
    end

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    private

    def user_not_authorized
        flash[:alert] = "No permition!"
        redirect_to(request.referrer || root_path)
    end
end
