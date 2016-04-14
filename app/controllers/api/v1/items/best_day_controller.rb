module Api
  module V1
    module Items
      class BestDayController < ApiController
        respond_to :json

        def show
          respond_with Item.find_by(id: params[:item_id]).best_day
        end
      end
    end
  end
end
