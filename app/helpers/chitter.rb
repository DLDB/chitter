helpers do

  def current_user    
    @current_user ||=User.get(session[:user_id]) if session[:user_id]
  end

  def time_diff(timestamp)
    diff=Time.now - timestamp
    return "#{(diff/60).ceil}m" if diff <=3600
    return "#{(diff/60/60).ceil}h" if diff <=86400
    "#{(diff/60/60/24).ceil}d"
  end

end