ActiveAdmin.register ModelB do
  ActiveAdminRelationRemover.prepare(self){
    filter!
  }
end
