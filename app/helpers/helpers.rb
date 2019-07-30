class Helpers
  def self.current_user(session)
    user_id = session[:id]
    current_user = User.find_by_id(user_id)
    current_user
  end

  def self.is_logged_in?(session)
    user_id = session[:id]
    !!user_id
  end
end
