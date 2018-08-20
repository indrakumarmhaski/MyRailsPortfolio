class LikesController < ApplicationController
    before_action :set_blog
    
    def create
        @like = Like.new(like_params)
        @like.user_id = current_user.id
        respond_to do |format|
          if @like.save
            format.html { redirect_to @blog }
          end
        end
      end


      private

      def set_blog
        @blog = Blog.find(params[:like][:blog_id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def like_params
        params.require(:like).permit(:blog_id)  
      end
end
