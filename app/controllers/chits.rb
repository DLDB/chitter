get '/chits' do
  @user = User.first(id: session[:user_id])
  @chits = Chit.all
  erb :chits
end

post '/chits' do
  @user = current_user
  @chit = Chit.create(content: params[:chit], user_id: @user.id)
  @chits = Chit.all
  erb :chits
end