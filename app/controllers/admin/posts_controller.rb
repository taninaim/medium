# separates PostsController from the non-admin one
module Admin
    class PostsController < Admin::BaseController
        def index
            @posts = Post.all 
        end

        def new
            @post = Post.new 
        end

        def show
            @post = Post.find(params[:id])
        end

        def create
            @post = Post.new(post_params)
            @post.state_changer = current_user
            
            if @post.save
                redirect_to admin_post_path(@post)
            else
                render :new
            end
        end

        def edit
            @post = Post.where(id: params[:id]).first
            # Alt: Post.find(params[:id])
        end

        def update
            @post = Post.find(params[:id])
            @post.state_changer = current_user

            if @post.update(post_params)
                redirect_to admin_post_path(@post)
            else
                render :edit
            end
        end

        def destroy
            @post = Post.find(params[:id])

            if @post.destroy
                redirect_to admin_posts_path
            end
        end

        private

        def post_params
            params.require(:post).permit(:title, :content, :state_event)
        end
    end
end

# Alternatively
# class Admin::PostsController < ApplicationController
# end