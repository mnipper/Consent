module Api
  module V1
    class ConsentFormsController < ApplicationController
      protect_from_forgery with: :null_session
      respond_to :json

      def create
        @consent_form = ConsentForm.new(params[:consent_form])
        if @consent_form.save
          render nothing: true, status: :created
        else
          render nothing: true, status: :unprocessable_entity
        end
      end
    end
  end
end
