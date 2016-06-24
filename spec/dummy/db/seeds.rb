AdminUser.delete_all
ModelA.delete_all
ModelB.delete_all
ModelC.delete_all

8.times do |n|
  password = n.to_s * 8
  AdminUser.create!(email: "#{password}@ex.com", password: password, password_confirmation: password)
end

9.times do
  ModelA.create!(admin_user: AdminUser.first)
end

10.times do
  ModelB.create!(admin_user: AdminUser.second, model_a: ModelA.offset(rand(ModelA.count)).first)
end

11.times do
  ModelC.create!(model_a: ModelA.offset(rand(ModelA.count)).first)
end