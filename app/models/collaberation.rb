class Collaboration < ActiveRecord::Base
  # attr_accessible :role, :wiki, :user, :wiki_id, :email

  belongs_to :wiki
  belongs_to :user

end
