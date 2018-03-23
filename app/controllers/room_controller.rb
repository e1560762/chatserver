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
  			room = Room.new
        room.name = params[:name]
        room.name_as_hash = Digest::SHA256.base64digest
  			room.save
  		end
  		redirect_to room_chat_path(room.name_as_hash)
  	end

  	def chat
      @name = Room.find_by_name_as_hash(params[:name]).name
  	end

  	def enter
  		@room = Room.find_by(params[:name])
  		if @room.nil?
  			@room = Room.new do |r|
  				r.name = params[:name]
  			end
  		end
  		redirect_to room_chat_path(@room.name_as_hash)
  	end
end
