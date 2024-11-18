class RewardsController < ApplicationController
  before_action :authenticate_user!

  def index
    # Find or create a reward record for the current user
    @reward = current_user.reward || current_user.create_reward(
      current_points: 0, daily_points: 0, weekly_points: 0, monthly_points: 0
    )

    @current_points = @reward.current_points

    # Dummy data for demonstration
    @daily_quest = { title: "Login Today", status: "Ongoing", points: 10 }
    @weekly_quest = { title: "Complete 5 Tasks", status: "Successful", points: 50 }
    @monthly_quest = { title: "Earn 1000 Points", status: "Failed", points: 100 }

    @dashboard = {
      ongoing: [@daily_quest],
      successful: [@weekly_quest],
      failed: [@monthly_quest]
    }
  end
end
