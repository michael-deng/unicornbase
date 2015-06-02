class IdeasController < ApplicationController

	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :show, :index]

	def new
		@idea = Idea.new
	end

	def create
		@idea = current_user.ideas.build(idea_params)
		if @idea.save
			flash[:success] = "Idea created!"
			redirect_to @idea
		else
			flash[:error] = "There was an error with your idea. Please try again."
			redirect_to new_idea_path
		end
	end

	def edit
		@idea = Idea.find(params[:id])
	end

	def update
		@idea = Idea.find(params[:id])
		if @idea.update_attributes(idea_params)
      flash[:success] = "Idea updated"
      redirect_to @idea
    else
      render 'edit'
    end
  end


	def show
		@idea = Idea.find(params[:id])
		@comments = @idea.comments.all
		@comment = @idea.comments.build
	end

	def index
		@ideas = Idea.all
	end

	private

		def idea_params
			params.require(:idea).permit(:title, :content)
		end
end
