class BuyersController < ApplicationController
    def new
        @buyer = Buyer.new
    end

    def create
        @buyer = Buyer.new(buyer_params)
        @buyer.save
    end

    def buyer_params
        params.require(:buyer).permit(:user)
    end
end