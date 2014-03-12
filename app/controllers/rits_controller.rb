class RitsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]

	def index
		@rits = Rit.all
	end 

	def preview
		@rit = Rit.find_by(hashcode: params[:rits])
	end

	def new 
		@rit = Rit.new
	end

	def create
		@rit = Rit.new(rit_params)
		@rit.hashcode = rand(5000).to_s
		if @rit.save
			render :index
		else
			render :create
		end
	end

	def redirector
		@rit = Rit.find_by(hashcode: params[:rits])
		redirect_to @rit.link

	end 

	private

	def rit_params
		params.require(:rit).permit(:link)
	end



end
