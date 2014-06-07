post '/signin' do
  username = '@' + params[:username].delete('@')
  password = params[:password]
  user = User.authenticate(username, password)
  if user
    session[:user_id] = user.id
    flash[:notice] = "You have successfully signed in"
    redirect to('/cheets')
  else
    flash[:error] = "Username or Password incorrect"
    redirect to('/')
  end
end