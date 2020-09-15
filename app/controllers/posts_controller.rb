class PostsController < ApplicationController
    
    def index
    end

    def create
        @user = User.find(params[:user_id])
        @post = @user.posts.create(post_params)
        redirect_to user_path(@user)
      end

      def destroy
        @user = User.find(params[:user_id])
        @post = @user.posts.find(params[:id])
        @post.destroy
        redirect_to user_path(@user)
      end

      def show
        @post = Post.find(params[:id])
     end
     
      private
        def post_params
          params.require(:post).permit(:post_text)
        end
end
