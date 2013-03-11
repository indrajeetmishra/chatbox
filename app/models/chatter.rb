class Chatter < ActiveRecord::Base
  attr_accessible :message, :name, :user_id
  belongs_to :user
end
