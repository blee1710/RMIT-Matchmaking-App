class Task
  include Mongoid::Document

  field :title, type: String
  field :description, type: String
  field :skills, type: String

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 400 }
end
