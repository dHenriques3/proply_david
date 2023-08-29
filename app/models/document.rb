class Document < ApplicationRecord
  belongs_to :property

  validates_presence_of :title, :type
end
