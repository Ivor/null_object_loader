require "null_object_loader/version"

module NullObjectLoader

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods

    def load_null_object(name, opts)
      null_class = opts[:null_class]
      load_if = opts[:load_if] || :nil?

      alias_method NullObjectLoader.temp_name_for_method(name), name
      define_method(name) do
        original_value = send(NullObjectLoader.temp_name_for_method(name))
        return original_value if !original_value.send(load_if)
        null_class.new
      end
    end

  end

  def self.temp_name_for_method(name)
    "null_object_loader_original_#{name}".to_sym
  end

end
