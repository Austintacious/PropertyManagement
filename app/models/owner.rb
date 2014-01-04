class Owner < ActiveRecord::Base
  has_many :buildings, dependent: :nullify
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email

  validates :first_name, format: {with: /\A[a-z]+\z/i}
  validates :last_name, format: {with: /\A[a-z]+\z/i}
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  def self.full_name
    first_name + " " + last_name
  end
end
