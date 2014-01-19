module ApplicationHelper
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end

  def store_return_to
    session[:return_to] = request.url
  end

  def redirect_back_or_default
    redirect_to(session[:return_to] || root_path)
    session[:return_to] = nil
  end

end
