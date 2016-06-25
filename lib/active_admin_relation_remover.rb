module ActiveAdminRelationRemover
  class << self
    def prepare(*args, &block)
      Remover.new(*args, &block)
    end
  end

  class Remover
    def initialize(register_block, options = {has_many_id_filter: true}, &block)
      @register_block = register_block
      @klass = pick_klass
      @options = options

      if block_given?
        self.instance_eval(&block)
      end
    end

    def brutal!
      filter!
      form!
      permit!
    end

    private

    def permit!
      using_attributes = attributes

      @register_block.instance_eval do
        permit_params using_attributes
      end
    end

    def form!
      using_attributes = attributes

      @register_block.instance_eval do
        form do |f|
          f.inputs '', *using_attributes
          f.actions
        end
      end
    end

    def filter!
      remover_filter_list = remove_filter_name
      filter_args_list = filter_arguments_list

      @register_block.instance_eval do
        preserve_default_filters!
        remover_filter_list.each { |removing| remove_filter removing }
        filter_args_list.each { |config| filter *config }
      end
    end

    def remove_filter_name
      @remove_filter_name ||= reflections.keys
    end

    def need_has_many?
      !!@options[:has_many_id_filter]
    end

    def through?(config)
      !!config.options[:through]
    end

    def filter_arguments_list
      @new_filter_config_list ||= reflections.map { |name, config|
        case
          when config.macro == :belongs_to
            [config.foreign_key, label: config.foreign_key]
          when need_has_many? && through?(config)
            ["#{config.options[:through]}_#{name.singularize}_id", label: "#{name}_id", as: :numeric]
          when need_has_many?
            ["#{name}_id", label: "#{name}_id", as: :numeric]
          else
            nil
        end
      }.compact
    end

    def reflections
      @reflections ||= @klass.reflections
    end

    def pick_klass
      @pick_klass ||= @register_block.config.resource_class_name.constantize
    end

    def editable_names
      @editable_names ||= reflections.map { |name, config| name if config.macro == :belongs_to }.compact
    end

    def attributes
      @attributes ||= @klass.columns.map(&:name).tap { |names|
        names.delete(@klass.primary_key)
      }
    end
  end
end
