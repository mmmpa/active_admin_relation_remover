ActiveAdmin.register ModelC do
  ActiveAdminRelationRemover.prepare(self){
    form!
  }
end
