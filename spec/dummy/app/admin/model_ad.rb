ActiveAdmin.register ModelAd do
  ActiveAdminRelationRemover.prepare(self){
    permit!
  }
end
