# -*- encoding : utf-8 -*-
module LoginSystem
  def self.included(base)
    base.send :helper_method, :current_user, :logged_in?
  end

  def login_user(user)
    @current_user = user
    session[:user_id] = user.id
  end

  def logout_user
    @current_user = :false
    session[:user_id] = nil
  end

  def current_user
    @current_user ||= (User.find_by_id(session[:user_id]) || :false)
  end

  def logged_in?
    current_user != :false
  end

  def login_required
    unless logged_in?
      store_location
      respond_to do |format|
        format.html {redirect_to not_login_user_sessions_path}
        format.js {render(:js => "alert('用户没有登录,请先登录');", :status => 401)}
      end
    end
  end

  def store_location
    session[:return_to] = request.fullpath if request.get?
  end

  def redirect_back_or_default(default = '/')
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
end
