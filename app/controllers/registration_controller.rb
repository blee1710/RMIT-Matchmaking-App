class RegistrationController< Devise::RegistrationController
    private 

    def sign_up_prams
        params.require(:user).permit(:name, :phone, :email, :password, :password_confirmation)
    end 
    def account_update_prams
        params.require(:user).permit(:name, :phone, :email, :password, :password_confirmation)
    end 
end 
