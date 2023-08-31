class Document < ApplicationRecord
  belongs_to :property

  has_one_attached :file

  validates_presence_of :title, :document_type
end
