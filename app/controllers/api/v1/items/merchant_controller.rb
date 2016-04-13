module Api
  module V1
    module Items
      class MerchantController < ApiController
        respond_to :json

        def show
          respond_with Item.find_by(id: params[:item_id]).merchant
        end
      end
    end
  end
end
