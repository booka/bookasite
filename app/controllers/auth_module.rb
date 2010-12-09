
module AuthModule
  protected
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def stored_or(default_path)
    default_path
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
