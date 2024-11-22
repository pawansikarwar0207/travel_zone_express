class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

         has_many :orders
    def admin?
      self.admin
    end
    has_one :reward, dependent: :destroy
    def name
      [first_name, middle_name, last_name].compact.join(" ").presence || "Unknown User"
    end
end
