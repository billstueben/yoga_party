Rails.application.routes.draw do


  get("/", { :controller => "yogi_authentication", :action => "home" })  

  # Routes for the Chapter resource:

  # CREATE
  post("/insert_chapter", { :controller => "chapters", :action => "create" })
          
  # READ
  get("/chapters", { :controller => "chapters", :action => "index" })
  
  get("/chapters/:path_id", { :controller => "chapters", :action => "show" })
  
  # UPDATE
  
  post("/modify_chapter/:path_id", { :controller => "chapters", :action => "update" })
  
  # DELETE
  get("/delete_chapter/:path_id", { :controller => "chapters", :action => "destroy" })

  #------------------------------

  # Routes for the Yoga class resource:

  # CREATE
  post("/insert_yoga_class", { :controller => "yoga_classes", :action => "create" })

  get("/yoga_classes/warm_up", { :controller => "yoga_classes", :action => "warm_up" })

          
  # READ
  get("/yoga_classes", { :controller => "yoga_classes", :action => "index" })
  
  get("/yoga_classes/:path_id", { :controller => "yoga_classes", :action => "show" })
  
  # UPDATE
  
  post("/modify_yoga_class/:path_id", { :controller => "yoga_classes", :action => "update" })
  
  # DELETE
  get("/delete_yoga_class/:path_id", { :controller => "yoga_classes", :action => "destroy" })

  #------------------------------

  # Routes for the Yogi account:

  # SIGN UP FORM
  get("/yogi_sign_up", { :controller => "yogi_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_yogi", { :controller => "yogi_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_yogi_profile", { :controller => "yogi_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_yogi", { :controller => "yogi_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_yogi_account", { :controller => "yogi_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/yogi_sign_in", { :controller => "yogi_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/yogi_verify_credentials", { :controller => "yogi_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/yogi_sign_out", { :controller => "yogi_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Pose resource:

  # CREATE
  post("/insert_pose", { :controller => "poses", :action => "create" })
    
  post("/insert_class_pose/:path_id", { :controller => "poses", :action => "class_pose" })

  # READ
  get("/poses", { :controller => "poses", :action => "index" })
  
  get("/poses/:path_id", { :controller => "poses", :action => "show" })
  
  # UPDATE
  
  post("/modify_pose/:path_id", { :controller => "poses", :action => "update" })
  
  # DELETE
  get("/delete_pose/:path_id", { :controller => "poses", :action => "destroy" })

   # DELETE
  get("/delete_class_pose/:path_id", { :controller => "poses", :action => "destroy_class_pose" })

  #------------------------------

end
