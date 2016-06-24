class ModelB < ActiveRecord::Base
  belongs_to :admin_user
  belongs_to :model_a
end
