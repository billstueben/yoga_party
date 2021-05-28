class ApplicationController < ActionController::Base
  before_action(:load_current_yogi)
  
  # Uncomment this if you want to force yogis to sign in before any other actions
  before_action(:force_yogi_sign_in)
  
  def load_current_yogi
    the_id = session[:yogi_id]
    @current_yogi = Yogi.where({ :id => the_id }).first
  end
  
  def force_yogi_sign_in
    if @current_yogi == nil
      redirect_to("/yogi_sign_in", { :notice => "You have to sign in first." })
    end
  end

end
