ActiveAdmin.register ModelB do
  exceptions, additions = ModelB.reflections.each.select { |_, config|
    ActiveRecord::Reflection::BelongsToReflection === config
  }.transpose

  additions.map! { |config| [config.foreign_key, label: config.foreign_key] }

  form do |f|
    f.inputs do
      additions.each { |config| f.input *config}
    end
    f.inputs except: exceptions
    f.actions
  end
end
