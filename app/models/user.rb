class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :properties, dependent: :destroy

  # these are all the tenancies of landlord
  has_many :tenancies_as_landlord, through: :properties, source: :tenancies
  # these are the landlords tasks
  has_many :tasks_as_landlord, through: :properties, source: :tasks
  # these are the landlords documents
  has_many :documents_as_landlord, through: :properties

  # the tasks that the user has created
  has_many :tasks, dependent: :destroy
  # this allows to get the subtasks for a user's task
  has_many :subtasks, through: :tasks
  # this is for the tenants to see their tenancies
  has_many :tenancies, dependent: :destroy
  # these are all the properties that a tenant has stayed at.
  has_many :properties_as_tenant, through: :properties, source: :tenancies
  # these are the documents that the tenant can see
  has_many :documents_as_tenant, through: :properties
  # these are all user's messages
  has_many :messages, dependent: :destroy

  # profile pricture
  has_one_attached :profile_picture, dependent: :destroy
end
