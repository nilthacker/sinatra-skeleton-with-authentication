get '/users/new' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    redirect "/users/#{@user.id}"
  else
    erb :register
  end
end

post '/users/new' do
  @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
  @user.password = params[:password_plaintext]
  if @user.save
    redirect "/sessions/new"
  else
    @errors = @user.errors.full_messages
    erb :register
  end
end