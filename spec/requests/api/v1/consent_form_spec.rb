require 'spec_helper'

describe "ConsentForm API" do
  before :all do
    @encrypted_name = 'bm5gkjwdfv6QBUqFPEnOaw==::CtQJyXdbuLeVzmIOIr0h/F9yh7xvz5KWUgxe/u4IkORGOW4KjU4bw+Wzve2vV1nLYUEWJJprr8sb+grm+Ao2sngNejiHzSkJKqZA/Pclw/Ok8KgHgN7olUz4BoCSdivIDRIT9ar06sNBrqOvLd4iGUlpMkpLdSJ69K08ebSvg5tED+PcK/oI6SJoVxRoUMYdYa9AfeIS9Ld5BgvhsaJgCKr089kfH2CzwpzlmRfdxb2qgyDXnk9PG/4WUEjjbamF/R74FNBdWkTLxZeLGdMImh87CQ6AOJ/v8l1JSzpPWwEjtmhTbFEzJPuA01tP5U5D07si0esJnab/B48iACEoLg==::iSmdDgnTzkEUv0yLbtFa8Q=='
    @encrypted_email = '9/1f+h2de6N8/JxnL5UyRA==::KctqCCCAOv9WKz9hgsEpYIQW6a3FxgPGqp2uWJyFOjTbyTlObfcRPcqr6Z5Enw8QOZYST9S1nTIjPwjElkgnekL7bQT0d1hOwbqd2tgMnUQHJaXpElRc4CCFn/039ThauIoU7WolReTP5XzrDyc38bZz2T68Ym8ir87mvKpYMfnJdS/de8KFSSUP8ZvxjtfrSBxKPFS5ifJkXmoR7UeSAlM2jmQ1p9WINwBpT4Abj4jAHdH3AGMd09nzh9Yexl3u+K9aVmAF4Dtu/l2wBXslgKyacW2LfrYRaXV/QBqPjG4fOVo7Pt8FjoYlPvpn3HlgfBleyRldnRbs2sVfHdQvGw==::+ad55IR9ZdGWLpc4H+VZC4mrnn/sbaYHU+X4jhKYKnc=' 
    @api_endpoint = "/api/v1/consent_forms"
  end

  before :each do
    @consent_form = FactoryGirl.create(:consent_form)
  end

  # Send encrypted values for name and email instead of the auto-decrypted ones,
  # since this is what will be coming into the api
  it 'returns a successful response if consent form is valid' do
    post @api_endpoint,
      consent_form:
        {
          'name' => @encrypted_name,
          'email' => @encrypted_email,
          'date' => @consent_form.date,
          'project_id' => @consent_form.project_id,
          'send_email_copy' => @consent_form.send_email_copy,
          'device_label' => @consent_form.device_label
        }
    expect(response).to be_success
  end

  it 'returns an unsuccessful response if consent form has a blank name' do
    post @api_endpoint,
      consent_form:
        {
          'name' => '',
          'email' => @encrypted_email,
          'date' => @consent_form.date,
          'project_id' => @consent_form.project_id,
          'send_email_copy' => @consent_form.send_email_copy,
          'device_label' => @consent_form.device_label
        }
    expect(response).to_not be_success
  end

  it 'should not respond to a get request' do
    lambda { get @api_endpoint }.should raise_error
  end
end
