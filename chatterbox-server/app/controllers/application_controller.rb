class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes

  get '/messages' do
  Message.all.order(:created_by).to_json
  end

  post '/messages' do
    my_message = Message.create(
      body: params[:body],
      username: params[:username],
      created_at: params[:created_at],
      updated_at: params[:updated_at]
    )
    my_message.to_json
  end

  patch '/messages/:id' do
    my_message = Message.find(params[:id])
    my_message.update(body: params[:body])
    my_message.to_json
  end

  delete '/messages/:id' do
    # find the review using the ID
    my_message = Message.find(params[:id])
    # delete the review
    my_message.destroy
    # send a response with the deleted review as JSON
    my_message.to_json
  end
  
end
