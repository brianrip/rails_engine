module Api
  module V1
    module Items
      class FinderController < ApiController
        respond_to :json

        def index
          respond_with Item.where(item_params)
        end

        def show
          respond_with Item.where(item_params).take
        end

        private

          def item_params
            params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
          end
      end
    end
  end
end
