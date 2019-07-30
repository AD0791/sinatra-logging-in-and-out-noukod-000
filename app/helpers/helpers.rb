class Helpers
  self.def current_user(session)
    user_id = session[:id]
    current_user = User.find_by_id(user_id)
    current_user
  end

  self.def is_logged_in?(session)
    
  end
end
