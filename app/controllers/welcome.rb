get '/' do
  if session[:user_id]
    redirect to('/chits')
  else
    erb :welcome
  end
end