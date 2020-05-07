module SessionsHelper
  def current_user
    User.find_by(id: session[:user_id])
  end

   def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    session[:user_id]
  end

  def only_signed_in
    if !logged_in?
      flash[:danger] = "Please sign in first"
      redirect_to new_session_path
    end
  end
end
