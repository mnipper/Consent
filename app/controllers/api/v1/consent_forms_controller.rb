module Api
  module V1
    class ConsentFormsController < ApplicationController
      protect_from_forgery with: :null_session
      respond_to :json

      def create
        @consent_form = ConsentForm.new(consent_form_params)
        if @consent_form.save
          render nothing: true, status: :created
        else
          render nothing: true, status: :unprocessable_entity
        end
      end

      private
        def consent_form_params
          params.require(:consent_form).permit(:name, :email, :date, :send_email_copy, :project_id, :device_label, :consent_text_id)
        end
    end
  end
end
