ActiveAdmin.register ModelE do
=begin
  preserve_default_filters!
  ModelD.reflections.each_pair do |name, config|
    remove_filter name
    if config.macro == :belongs_to
      filter config.foreign_key, label: config.foreign_key
    else
      through = config.options[:through]
      if !!through
        filter "#{through}_#{name.singularize}_id", label: "#{name}_id", as: :numeric
      else
        filter "#{name}_id", label: "#{name}_id", as: :numeric
      end
    end
  end

  editable_names = ModelD.reflections.map { |name, config| name if config.macro == :belongs_to }.compact

  attributes = ModelD.attribute_names.dup.tap { |names|
    names.delete(ModelD.primary_key)
  }.map do |name|
    if editable_names.include?(name)
      ModelD.reflections[name].foreign_key
    else
      name
    end
  end

  form do |f|
    f.inputs '', *attributes
  end
=end
end
