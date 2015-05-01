class ConsentMailer < ActionMailer::Base
  default from: "consent@adaptlab.org"

  def send_consent(consent_form)
    @name = consent_form.name
    @email = consent_form.email
    @consent_text = consent_form.consent_text

    mail to: @email, subject: 'Consent form from adaptlab'
  end
end
