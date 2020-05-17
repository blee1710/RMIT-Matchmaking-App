class Task
  include Mongoid::Document

  belongs_to :user, optional: true

  before_save do
    self.skills.gsub!(/[\[\]\"]/, "") if attribute_present?("skills")
  end
  field :title, type: String
  field :description, type: String
  field :skills, type: String

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 400 }
end
