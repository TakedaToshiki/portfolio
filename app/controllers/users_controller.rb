class UsersController < ApplicationController
      before_action :authenticate_user!, :only => [:show, :index, :edit, :update]

    def show
        @user = User.find_by(id: params[:id])

    end
    
    def index
        if params[:search].present?
       logger.debug("======================== params = #{params[:search]}")
          @users = User.where('nickname LIKE ?', "%#{params[:search]}%").or(User.where('favor_game LIKE ?', "%#{params[:search]}%")).order(created_at: :desc)
        else
          @users = User.all.order(created_at: :desc)
        end
    end
    
    def edit
    @user = User.find_by(id: params[:id])
    end
    
    def update
    @user = User.find_by(id: params[:id])
    @user.update(params.require(:user).permit(:first_name, :family_name, :self_introduction))    
    end
end
