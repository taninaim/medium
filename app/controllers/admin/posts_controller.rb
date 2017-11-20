# separates PostsController from the non-admin one
module Admin
    class PostsController < ApplicationController
        def index
            @posts = Post.all 
        end
    end
end

# Alternatively
# class Admin::PostsController < ApplicationController
# end