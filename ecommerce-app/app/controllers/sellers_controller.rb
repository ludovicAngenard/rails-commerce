class SellersController < ApplicationController
    def new
        @seller = Seller.new
    end

    def create
        @seller = Seller.new(seller_params)
        @seller.save
    end

    def seller_params
        params.require(:seller).permit(:user)
    end
end