ActiveAdmin.register ModelA do
  columns = ModelA.columns.map(&:name).tap { |names|
    names.delete(ModelA.primary_key)
  }

  form do |f|
    f.inputs '', *columns
  end
end