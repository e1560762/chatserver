class UserController < ApplicationController
	def index
		@users = User.all
  	end

  	def new
  		@user = User.new
  	end

  	def create
  		@user = @user || User.new
  		user = User.find_by(username: params[:name])
  		if user.nil?
  			@user.username = params[:name]
  			@user.is_login = true
  			@user.last_connected_time = Time.now
			@user.last_connected_ip = request.remote_ip
  			@user.save
  			redirect_to room_index_url
  		else
  			flash[:error] = "User already exists. Choose a new name or login."
  			redirect_to user_index_url
  		end
  	end

  	def login
  		@user = User.find_by(username: params[:name])
  		if user.nil?
  			flash[:error] = "User does not exist."
  			redirect_to room_new_url
  		end
  		@user.update(is_login: true, last_connected_time: Time.now, last_connected_ip: request.remote_ip)
  		redirect_to room_index_url
  	end
end
