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
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def signed_in?
    !current_user.nil?
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
      redirect_to new_session_path
    end
  end

  def require_admin
    require_login
    unless @current_user.user_type.downcase == 'admin'
      render file: 'public/403.html', status: :forbidden, :layout => false
    end
  end

end
