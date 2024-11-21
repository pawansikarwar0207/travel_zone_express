require "test_helper"

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  def index
    if params[:query].present?
      @users = User.where("first_name ILIKE :query OR last_name ILIKE :query OR email ILIKE :query", query: "%#{params[:query]}%")
    else
      @users = User.all
    end
    @users = @users.order(created_at: :desc).page(params[:page])
  end
end
