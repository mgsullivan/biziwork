class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :memberships, dependent: :destroy
  has_many :ownerships, dependent: :destroy
  
  has_many :tasks, dependent: :nullify
  has_many :allocations, dependent: :destroy
  has_many :teams, through: :memberships
  has_many :owned_teams, through: :ownerships, class_name: "Team", foreign_key: "team_id"
  
end
