class ChatChannel < ApplicationCable::Channel
  	def subscribed
  	  stream_from "chat_channel_#{params[:room]}"
  	end
=begin
  	def receive(data)
  	  ActionCable.server.broadcast "chat_channel_#{params[:room]}", data
  	end
=end
end