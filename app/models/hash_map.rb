class HashMap < ApplicationRecord

  belongs_to :user

  validates_presence_of :name
  validates_presence_of :data
end
