class UsersController < ApplicationController
	before_action :find_user, only: [:show, :update, :edit, :destroy]
	before_action :find_post, only: [:show]

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id
			flash[:notice] = "User Sucessfully Created!"
			redirect_to @user
		else
			flash[:alert] = "User not created"
			render 'user/index'
		end
	end




	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email)
	end

	def post_params
		params.require(:post).permit(:content, :user_id, :created_by, :profile_id)
	end

	def find_post
		@post = Post.find(params[:id])
	end

	def find_user
		@user = User.find(params[:id])
	end
end
