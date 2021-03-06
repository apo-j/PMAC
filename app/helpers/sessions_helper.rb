module SessionsHelper

  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.where('remember_token = ? and state > 0', remember_token).first
  end

  def signed_in?
    !current_user.nil?
  end

  def admin?
    if !current_user.nil?
      current_user[:user_type ] == 'admin'
    else
      false
    end
  end

  def sign_out
    current_user.update_attribute(:remember_token,
    User.encrypt(User.new_remember_token))
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def require_login
    unless signed_in?
      store_return_to
      redirect_to  new_session_path
    end
  end

  def require_admin
    if !signed_in?
      store_return_to
      redirect_to new_session_path
    elsif @current_user.user_type.downcase != 'admin'
      render file: 'public/403.html', status: :forbidden, :layout => false
    end

  end

end
