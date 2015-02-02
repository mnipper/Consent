module Api
  module V1
    class ConsentTextsController < ApplicationController
      protect_from_forgery with: :null_session
      respond_to :json
      
      def index
        respond_with ConsentText.all
      end
      
    end
  end
end
