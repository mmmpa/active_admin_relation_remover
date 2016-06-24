ActiveAdmin.register ModelB do
  form do |f|
    def (f.object.admin_user).name
      email
    end

    f.inputs
    f.actions
  end
end
