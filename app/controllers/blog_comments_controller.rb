class BlogCommentsController < ApplicationController

    before_action :set_blog
    
    def create
        @comment = BlogComment.new(blogcomment_params)
        @comment.user_id = current_user.id
        respond_to do |format|
          if @comment.save
            format.html { redirect_to @blog }
          end
        end
      end


      private

      def set_blog
        @blog = Blog.find(params[:blog_comment][:blog_id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def blogcomment_params
        params.require(:blog_comment).permit(:comment, :blog_id)  
      end

end
