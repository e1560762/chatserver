class RoomController < ApplicationController
  	def index
  		@rooms = Room.all
  	end

  	def new
  		@room = Room.new
  	end

  	def create
  		room = Room.find_by(name: params[:name])
  		if room.nil?
  			@room.name = params[:name]
  			@room.save
  		else
  			@room = room
  		end
  		redirect_to room_chat_url(@room.id)
  	end

  	def chat
  	end

  	def enter
  		@room = Room.find_by(params[:name])
  		if room.nil?
  			@room = Room.new do |r|
  				r.name = params[:name]
  			end
  		end
  		redirect_to room_chat_url(@room.id)
  	end
end
