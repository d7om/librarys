class Book < ActiveRecord::Base
  belongs_to :author
  belongs_to :publisher
  belongs_to :location

  attr_accessible :name, :copies, :isbn, :language, :version, :pages, :category,
                  :location_id,   :location_attributes,       :author_id,
                  :publisher_id,  :author_attributes,         :publisher_attributes

  accepts_nested_attributes_for :location, reject_if: proc { |attributes| attributes['name'].blank? }
  accepts_nested_attributes_for :author, reject_if: proc { |attributes| attributes['name'].blank? }
  accepts_nested_attributes_for :publisher, reject_if: proc { |attributes| attributes['name'].blank? }



  validates :name,      presence:true
  validates :author,    presence:true
  validates :publisher, presence:true
  validates :location,  presence:true
end
