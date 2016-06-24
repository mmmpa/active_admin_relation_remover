ActiveAdmin.register ModelA do
  AdminUser.class_eval do
    return if method_defined?(:name)

    def name
      email
    end
  end

  preserve_default_filters!
  ModelA.reflections.each_pair do |name, config|
    remove_filter name
    if ActiveRecord::Reflection::BelongsToReflection === config
      filter config.foreign_key, label: config.foreign_key
    else
      filter "#{name}_id", label: "#{name}_id", as: :numeric
    end
  end
end
