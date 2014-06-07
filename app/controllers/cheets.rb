get '/cheets' do
  @user = User.first(id: session[:user_id])
  erb :cheets
end