class Tenancy < ApplicationRecord
  attr_accessor :email
  belongs_to :property
  belongs_to :user

end
