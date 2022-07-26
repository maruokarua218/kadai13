class Admin::UsersController < ApplicationController
  skip_before_action :login_required, only: %i[new create]
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :check_admin, only: %i[new create]

  def index
    @users = User.all
  end

  def show
    @user_tasks = @user.tasks
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to admin_root_path, success: 'ログインしました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def update
      if @user.update(user_params)
        redirect_to admin_user_path, notice: "ユーザー情報を更新しました"
      else
        render :edit
      end
    end

  def destroy
    if @user.destroy
      redirect_to admin_users_path, notice: "ユーザーを削除しました"
    else
      redirect_to admin_users_path
    end
  end

  private

  def check_admin
    redirect_to root_path, warning: '権限がありません' unless current_user.admin?
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :admin)
  end

end
