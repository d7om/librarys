class Publisher < ActiveRecord::Base
  attr_accessible :name

  has_many :books

  #validates :name, presence:true
end
