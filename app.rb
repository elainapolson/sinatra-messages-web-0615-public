class MessagesApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @messages = Message.all
    @body_class = "messages"

    erb :messages
  end

  post '/' do
    message = Message.new
    message.to = params[:to]
    message.content = params[:content]
    message.from = params[:from]
    message.save
  end

end