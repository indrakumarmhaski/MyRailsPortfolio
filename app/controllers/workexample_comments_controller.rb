class WorkexampleCommentsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_workexample
    access all: [:create], user: [:create], site_admin: :all    
    
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


      private

      def set_workexample
        @workexample = Workexample.find(params[:workexample_comment][:workexample_id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def workexamplecomment_params
        params.require(:workexample_comment).permit(:comment, :workexample_id)  
      end


end
