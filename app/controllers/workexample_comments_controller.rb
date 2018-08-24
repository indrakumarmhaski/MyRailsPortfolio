class WorkexampleCommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_workexample, only: [:create]
    before_action :set_workexample_and_comment, only: [:destroy]
    access all: [:create], user: [:create, :destroy ], site_admin: :all    
    
    def create
        @comment = WorkexampleComment.new(workexamplecomment_params)
        @comment.user_id = current_user.id
        respond_to do |format|
          if @comment.save
            format.html { redirect_to @workexample }
          else
            format.html { redirect_to @workexample, notice: 'Something went wrong.' }
          end
        end
      end

      def destroy
        if(current_user.id == @comment.user_id || logged_in?(:site_admin))
          @comment.destroy
          redirect_to @workexample, notice: 'Comment was successfully deleted'
        else
          redirect_to @workexample, notice: 'Permission Denied'
        end  
      end

      private

      def set_workexample
        @workexample = Workexample.find(params[:workexample_comment][:workexample_id])
      end

      def set_workexample_and_comment
        @comment = WorkexampleComment.find(params[:id])
        @workexample = @comment.workexample
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def workexamplecomment_params
        params.require(:workexample_comment).permit(:comment, :workexample_id)  
      end


end
