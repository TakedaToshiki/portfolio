class InquiriesController < ApplicationController
    
    def new
        @inquiry = Inquiry.new
    end
    
    def create
         @inquiry = Inquiry.new(inquiry_params)
 
         respond_to do |format|       
            if @inquiry.save     
             GameAppMailer.send_when_create(@inquiry).deliver         
             GameAppMailer.send_when_create_admin(@inquiry).deliver         
             format.html { redirect_to @inquiry, notice: 'お問合せ受け付けました。' }         
             format.json { render :show, status: :created, location: @inquiry }       
            else         
             format.html { render :new, notice: 'お問合せ受け付けできませんでした。' }         
             format.json { render json: @inquiry.errors, status: :unprocessable_entity }       
            end     
             end  
    end
    
    
    def show
        @inquiry = Inquiry.find_by(id: params[:id])
    end
    
    
    def index
        @inquiries = Inquiry.all.order(created_at: :desc)
        @inquiries = Inquiry.page(params[:page]).per(10)

    end
    
    def destroy
        @inquiry = Inquiry.find_by(id: params[:id])
    end
    
    private
      def inquiry_params
          params.require(:inquiry).permit(:name, :email, :phone, :content)
      end

end
