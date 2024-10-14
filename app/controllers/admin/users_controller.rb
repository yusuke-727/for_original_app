class Admin::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_user
    
    def index
      @users = User.all
    end
    
  
    
    private
  
    def admin_user
      redirect_to(root_path) unless current_user.is_admin?
    end

    def ensure_admin_user
        unless current_user.is_admin?
          redirect_to root_path, alert: "アクセス権限がありません。"
        end
    end
  end
  