get '/oldchit' do
  @cheets = Cheet.all
  jbuilder :oldchit
  erb :oldchit
end