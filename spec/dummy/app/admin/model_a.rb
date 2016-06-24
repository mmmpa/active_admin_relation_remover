ActiveAdmin.register ModelA do
  AdminUser.class_eval do
    return if method_defined?(:name)
    def name
      email
    end
  end
end
