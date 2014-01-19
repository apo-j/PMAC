module UsersHelper
  def setup_address(user)
    user.addresses.build if user.addresses.empty?
  end

end
