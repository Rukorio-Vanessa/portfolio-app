class UserController < Sinatra::Base
    get '/hello' do
        "Testing out my controller, it worked!"
    end
end