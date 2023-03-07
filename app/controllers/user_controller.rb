class UserController < Sinatra::Base
    
    #read json
    before do
        begin
          @user = user_data
        rescue
          @user = nil
        end
    end
    

       
    post '/auth/register' do
        begin
          #create new user
          x = User.create(@user)
          json_response(code: 201, data: x)
        rescue => e
          error_response(422, e)
        end
      end
      
    
    post '/auth/login' do
        begin
        user_data = User.find_by(email: params[:email])
        
        if user_data && user_data.authenticate(params[:password])
          json_response(code: 200, data: {id: user_data.id, email: user_data.email})
        else
          json_response(code: 422, data: {message: 'wrong email  or password input!'})
        rescue => e
            error_response(422, e)
        end
    end
      
      

    get '/user' do
        user = User.all
        json_response(data: user)
    end

    

    #private func to parse json data for the user
    private
    def user_data
      JSON.parse(request.body.read)
    end
end