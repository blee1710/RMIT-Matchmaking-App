class Task
  include Mongoid::Document

  embedded_in :user

  before_save do
    self.skills.gsub!(/[\[\]\"]/, "") if attribute_present?("skills")
  end
  field :title, type: String
  field :description, type: String
  field :skills, type: String
  field :phone, type: String

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 400 }
  validates :phone, presence: true
end
