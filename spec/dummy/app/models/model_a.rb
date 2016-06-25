class ModelA < ActiveRecord::Base
  belongs_to :admin_user
  has_one :model_b
  has_many :model_bs
  has_many :model_ads
  has_many :model_ds, through: :model_ads
end
