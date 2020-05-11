class Worker
  include Mongoid::Document
  field :name, type: String
  field :last_name, type: String
  field :phone, type: String
  field :location, type: String
  field :email, type: String
  field :business, type: String
  field :business_type, type: String
end
