get '/users/:user_id' do
  @logged_in_as = User.find(session[:user_id]) if session[:user_id]
  @viewing_user = User.find(params[:user_id])

  if @logged_in_as && @logged_in_as.id == @viewing_user.id
    erb :user
  else
    erb :not_authorized
  end
end