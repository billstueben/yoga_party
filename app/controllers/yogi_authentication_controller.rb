class YogiAuthenticationController < ApplicationController
  # Uncomment this if you want to force yogis to sign in before any other actions
  skip_before_action(:force_yogi_sign_in, { :only => [:sign_up_form, :create, :sign_in_form, :create_cookie] })

  def home
    render({ :template => "yogi_authentication/home.html.erb" })
  end

  def sign_in_form
    render({ :template => "yogi_authentication/sign_in.html.erb" })
  end

  def create_cookie
    yogi = Yogi.where({ :email => params.fetch("query_email") }).first
    
    the_supplied_password = params.fetch("query_password")
    
    if yogi != nil
      are_they_legit = yogi.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/yogi_sign_in", { :alert => "Incorrect password." })
      else
        session[:yogi_id] = yogi.id
      
        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/yogi_sign_in", { :alert => "No yogi with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end

  def sign_up_form
    render({ :template => "yogi_authentication/sign_up.html.erb" })
  end

  def create
    @yogi = Yogi.new
    @yogi.email = params.fetch("query_email")
    @yogi.password = params.fetch("query_password")
    @yogi.password_confirmation = params.fetch("query_password_confirmation")
    @yogi.first_name = params.fetch("query_first_name")
    @yogi.last_name = params.fetch("query_last_name")

    save_status = @yogi.save

    if save_status == true
      session[:yogi_id] = @yogi.id
   
      redirect_to("/", { :notice => "Yogi account created successfully."})
    else
      redirect_to("/yogi_sign_up", { :alert => "Yogi account failed to create successfully."})
    end
  end
    
  def edit_profile_form
    render({ :template => "yogi_authentication/edit_profile.html.erb" })
  end

  def update
    @yogi = @current_yogi
    @yogi.email = params.fetch("query_email")
    @yogi.password = params.fetch("query_password")
    @yogi.password_confirmation = params.fetch("query_password_confirmation")
    @yogi.first_name = params.fetch("query_first_name")
    @yogi.last_name = params.fetch("query_last_name")
    
    if @yogi.valid?
      @yogi.save

      redirect_to("/", { :notice => "Yogi account updated successfully."})
    else
      render({ :template => "yogi_authentication/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_yogi.destroy
    reset_session
    
    redirect_to("/", { :notice => "Yogi account cancelled" })
  end
 
end
