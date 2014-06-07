post '/signup' do
  @user = User.create(name: params["name"], 
    email: params["email"], 
    username: '@' + params["username"].delete('@'), 
    password: params["password"],
    password_confirmation: params["password_confirmation"])
  if @user.save
    session[:user_id] = @user.id
    flash[:notice] = "Sign up successful!"
    redirect to('/')
  else
    flash.now[:error] = @user.errors.full_messages
    erb :signup
  end
end

get '/signup' do
  erb :signup
end