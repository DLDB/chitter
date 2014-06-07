get '/' do
  if session[:user_id]
    redirect to('/cheets')
  else
    erb :welcome
  end
end