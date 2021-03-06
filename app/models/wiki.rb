class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :users, through: "collaborations" #, class_name: "User"
  has_many :collaborations
  has_many :articles, dependent: :destroy

  # attr_accessible :description, :topic, :privacy
  # validates :description, presence: true
  # validates :topic, presence: true
  # validates :topic, length: { maximum: 40 }
  # validates :description, length: { maximum: 140 }


  # extend FriendlyId
  # friendly_id :topic, use: :history

  scope :visible_to, where(privacy: false)

  # TODO: Determine query for collab
  # scope :possible_collaborators, !user && !users && where(user.subscribed)
end
