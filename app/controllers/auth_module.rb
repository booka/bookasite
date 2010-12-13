
module AuthModule
  protected
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def require_user
    unless current_user
      store_location
      redirect_to login_path
    end
  end

  def require_admin
    unless current_user
      store_location
      redirect_to login_path
    end
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def stored_or(default_path)
    path = session[:return_to] || default_path
    session[:return_to] = nil
    path
  end

  def signed_in?
    !!current_user
  end

  def clear_user
    @current_user = nil
    session[:user_id] = nil
  end

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
  end
end
