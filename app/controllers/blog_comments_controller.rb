class BlogCommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_blog, only: [:create]
    before_action :set_blog_and_comment, only: [:destroy]
    access all: [:create], user: [:create,:destroy], site_admin: :all    
    
    def create
        @comment = BlogComment.new(blogcomment_params)
        @comment.user_id = current_user.id
        respond_to do |format|
          if @comment.save
            format.html { redirect_to @blog }
          else
            format.html { redirect_to @blog, notice: 'Something went wrong.' }
          end
        end
      end

      def destroy
        if(current_user.id == @comment.user_id || logged_in?(:site_admin))
          @comment.destroy
          redirect_to @blog, notice: 'Comment was successfully deleted'
        else
          redirect_to @blog, notice: 'Permission Denied'
        end
        end

      private

      def set_blog
        @blog = Blog.find(params[:blog_comment][:blog_id])
      end

      def set_blog_and_comment
        @comment = BlogComment.find(params[:id])
        @blog = @comment.blog
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def blogcomment_params
        params.require(:blog_comment).permit(:comment, :blog_id)  
      end

end
