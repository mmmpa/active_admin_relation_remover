class ModelAd < ActiveRecord::Base
  belongs_to :model_a
  belongs_to :model_d
end
