class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  #
  # protected
  #
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:account_update) { |u|
  #     u.permit(:password, :password_confirmation, :current_password)
  #   }
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:name, :email, :phone, :password, :password_confirmation)
    end
  end

  def check_for_admin
    redirect_to root_path unless current_user.is_admin
  end

  def check_for_confirmed
    redirect_to root_path unless current_user.is_confirmed
  end

  # показывает может ли текущий залогиненный юзер править эту модель
  def current_user_can_edit?(model)
    user_signed_in? && (current_user.is_admin ||
        (model.user == current_user || # если у модели есть юзер и он залогиненный
            # пробуем у модели взять .event и если он есть, проверяем его юзера
            (model.try(:post).present? && model.post.user == current_user)))
  end
end
