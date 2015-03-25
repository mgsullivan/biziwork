class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :memberships
  has_many :ownerships
  
  has_many :tasks, dependent: :destroy
  has_many :teams, through: :memberships
  has_many :owned_teams, through: :ownerships, class_name: "Team", foreign_key: "team_id"
end
