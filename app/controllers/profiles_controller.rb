class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @reward = current_user.reward || current_user.create_reward(current_points: 0)
  end
end
