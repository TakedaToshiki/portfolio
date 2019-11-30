class GameAppMailer < ApplicationMailer
    def send_when_create(inquiry)     
        @inquiry =  inquiry    
        mail to: inquiry.email,     
        subject: 'お問い合わせありがとうございます！'   
    end
    
    def send_when_create_admin(inquiry)     
        @inquiry =  inquiry    
        mail to: inquiry.email,     
        subject: "#{inquiry.name}様からお問合せ受付ました"   
    end     
    
    # def send_answer_create(answer)     
    #     @answer =  answer    
    #     mail to: user.email,     
    #     subject: 'ご回答ありがとうございます！'   
    # end
    
    # def send_answer_create_admin(answer)     
    #     @answer =  answer    
    #     mail to: user.email,     
    #     subject: "#{user.nickname}様から回答を受付ました"   
    # end     
end 
 
 

