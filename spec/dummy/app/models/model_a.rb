class ModelA < ActiveRecord::Base
  belongs_to :admin_user
  has_many :model_bs
end
