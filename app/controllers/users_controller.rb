class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_for_admin, only: [:index, :update_state]

  helper_method :user, :users

  # GET /users
  def index
    users
  end

  # GET /users/1
  def show
    user
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  def update
    if user.update(user_params)
      redirect_to user #, notice: I18n.t('controllers.users.updated')
    else
      render :edit
    end
  end

  def update_state
    user.is_confirmed = params[:state]
    user.save!
    redirect_to users_path
  end

  private

  def users
    @users ||= User.all
  end

  def user
    @user ||= User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.fetch(:user, {}).permit(:email, :name, :phone, :is_confirmed)
  end

end
