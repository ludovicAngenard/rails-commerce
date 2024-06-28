class UsersController < ApplicationController
    def new
      @user = User.new

    end

    def create
      @user = User.new(user_params)
      if @user.seller == 1
        @seller = Seller.create(user: @user)
        @user.seller = @seller
      end
      @buyer = Buyer.create(user: @user)
      @user.buyer = @buyer
      if @user.save
        # Rediriger vers une page après l'inscription réussie
        redirect_to "/", notice: 'Inscription réussie !'
      else
        render :new
      end
    end

    def login
      @user = User.new
    end

    def login_process
      @user = User.find_by(email: params[:user][:email])

      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to "/", notice: 'Connexion réussie !'
      else
        flash.now[:alert] = 'Email ou mot de passe incorrect.'
        render :login
      end
    end

    def logout
      session[:user_id] = nil
      redirect_to "/login", notice: 'Déconnexion réussie.'
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :seller)
    end
  end
