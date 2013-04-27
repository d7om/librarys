class Location < ActiveRecord::Base
  attr_accessible :name, :rack
  has_many :books

  #validates :name, presence:true
end
