if ENV['BIG_DATA_E']
  2000.times do
    ModelE.create!(model_d: ModelD.create!)
  end

  raise 'end'
end


AdminUser.delete_all
ModelA.delete_all
ModelB.delete_all
ModelC.delete_all

def d2(n)
  (n % 2) + 1
end

2.times do |n|
  password = n.to_s * 8
  AdminUser.create!(email: "#{password}@ex.com", password: password, password_confirmation: password)
end

3.times do
  ModelA.create!(admin_user: AdminUser.first)
end

4.times do |n|
  ModelB.create!(admin_user: AdminUser.second, model_a: ModelA.find(d2(n)))
end

5.times do |n|
  ModelC.create!(model_a: ModelA.find(d2(n)))
end

6.times do |n|
  ModelAd.create!(model_a: ModelA.find(d2(n)), model_d: ModelD.create!)
end
