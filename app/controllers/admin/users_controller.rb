class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def new
    @user = User.new
    if params[:query].present?
      @users = User.where("first_name ILIKE :query OR last_name ILIKE :query OR email ILIKE :query", query: "%#{params[:query]}%")
    else
      @users = User.all
      @users = User.page(params[:page]).per(10)
    end
    @users = @users.order(created_at: :desc).page(params[:page])
  end
  

  def create
    @user = User.new(user_params)
    @user.password = params[:user][:temporary_password]
    if @user.save
      redirect_to new_admin_user_path, notice: "User successfully created."
    else
      render :new, alert: "Error creating user."
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to new_admin_user_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to new_admin_user_path, notice: 'User was successfully deleted.'
  end  

  private

  def user_params
    params.require(:user).permit(
      :first_name, :middle_name, :last_name, :suffix,
      :group, :status, :email, :role
    )
  end
end
