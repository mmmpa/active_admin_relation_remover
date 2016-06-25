ActiveAdmin.register ModelD do
  ActiveAdminRelationRemover.prepare(self){
    permit!
  }
end
