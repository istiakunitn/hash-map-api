class UsernameGenerator
  def run(user)
    username = ["user", user.first_name, user.last_name, rand(1000).to_s].reject(&:blank?).join("-")
    while User.exists?(username: username)
      username = ["user", user.first_name, user.last_name, rand(1000).to_s].reject(&:blank?).join("-")
    end
    username
  end
end
