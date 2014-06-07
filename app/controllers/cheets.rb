get '/cheets' do
  @user = User.first(id: session[:user_id])
  @cheets = Cheet.all
  erb :cheets
end

post '/cheets' do
  @user = current_user
  @cheet = Cheet.create(content: params[:cheet], user_id: @user.id)
  @cheets = Cheet.all
  erb :cheets
end