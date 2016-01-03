get '/register' do
  erb :register
end

post '/register' do
  @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
  @user.password = params[:password]
  if @user.save
    redirect "/login"
  else
    @errors = @user.errors.full_messages
    erb :register
  end
end