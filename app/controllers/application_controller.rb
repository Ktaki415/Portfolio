class ApplicationController < ActionController::Base
	before_action :cofigure_permitted_parameters, if: :devise_controller?

	private
	# sign_up時のredirect先変更
	def after_sign_in_path_for(resource)
	  user_path(resource)
	end

	# sign_out時のredirect先変更
	def after_sign_out_path_for(resource)
	  root_path
	end

	def cofigure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email]) #ログイン時にname使用
	end
end
