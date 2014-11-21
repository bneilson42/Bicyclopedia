class Wiki < ActiveRecord::Base

    #extend FriendlyId
    #friendly_id :title, use: [:slugged, :history]

    #attr_accessible :body, :public, :title

    belongs_to :user
    has_many :wiki_collaborations
    has_many :users, through: :wiki_collaborations

    validates :user_id, presence: true
    validates :title, presence: true, length: { maximum: 220 }
    validates :body, presence: true, length: { minimum: 20 }

    #default_scope order: 'wikis.created_at DESC'
end
