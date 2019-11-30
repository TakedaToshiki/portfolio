class AnswersController < ApplicationController
    def new
        @inquiry = Inquiry.find_by(id: params[:id])
        @answer = Answer.new
    end
    
    def create
#   @answer = Answer.new(answer_params)
 
#          respond_to do |format|       
#             if @answer.save     
#              GameAppMailer.send_answer_create(@answer).deliver         
#              GameAppMailer.send_answer_create_admin(@answer).deliver         
#              format.html { redirect_to @answer, notice: 'ご回答ありがとうございます' }         
#              format.json { render :show, status: :created, location: @answer }       
#             else         
#              format.html { render :new, notice: 'ご回答受付できませんでした' }         
#              format.json { render json: @answer.errors, status: :unprocessable_entity }       
#             end     
#              end  
    @answer = Answer.new(answer_params)
        if @answer.save
                flash[:notice] = "ご回答ありがとうございます"
                redirect_to inquiries_path
        else
                flash[:notice] = "送信されませんでした"
                render "answer/new"
        end
    end
    
    private 
      def answer_params
          params.require(:answer).permit(:inquiry_id, :answer)
      end
      
end
