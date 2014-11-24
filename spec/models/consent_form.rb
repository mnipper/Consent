require "spec_helper"

describe ConsentForm do
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:send_email_copy) }
  it { should respond_to(:date) }
  it { should respond_to(:project_id) }
  it { should respond_to(:device_label) }

  describe 'field decryption' do
    before :each do
      @consent_form = ConsentForm.new
    end

    it "should decrypt an encrypted name" do
      encrypted_name = 'bm5gkjwdfv6QBUqFPEnOaw==::CtQJyXdbuLeVzmIOIr0h/F9yh7xvz5KWUgxe/u4IkORGOW4KjU4bw+Wzve2vV1nLYUEWJJprr8sb+grm+Ao2sngNejiHzSkJKqZA/Pclw/Ok8KgHgN7olUz4BoCSdivIDRIT9ar06sNBrqOvLd4iGUlpMkpLdSJ69K08ebSvg5tED+PcK/oI6SJoVxRoUMYdYa9AfeIS9Ld5BgvhsaJgCKr089kfH2CzwpzlmRfdxb2qgyDXnk9PG/4WUEjjbamF/R74FNBdWkTLxZeLGdMImh87CQ6AOJ/v8l1JSzpPWwEjtmhTbFEzJPuA01tP5U5D07si0esJnab/B48iACEoLg==::iSmdDgnTzkEUv0yLbtFa8Q=='
      @consent_form.name = encrypted_name
      @consent_form.name.should == 'Kemba Walker'
    end

    it "should decrypt an encrypted email" do
      encrypted_email = '9/1f+h2de6N8/JxnL5UyRA==::KctqCCCAOv9WKz9hgsEpYIQW6a3FxgPGqp2uWJyFOjTbyTlObfcRPcqr6Z5Enw8QOZYST9S1nTIjPwjElkgnekL7bQT0d1hOwbqd2tgMnUQHJaXpElRc4CCFn/039ThauIoU7WolReTP5XzrDyc38bZz2T68Ym8ir87mvKpYMfnJdS/de8KFSSUP8ZvxjtfrSBxKPFS5ifJkXmoR7UeSAlM2jmQ1p9WINwBpT4Abj4jAHdH3AGMd09nzh9Yexl3u+K9aVmAF4Dtu/l2wBXslgKyacW2LfrYRaXV/QBqPjG4fOVo7Pt8FjoYlPvpn3HlgfBleyRldnRbs2sVfHdQvGw==::+ad55IR9ZdGWLpc4H+VZC4mrnn/sbaYHU+X4jhKYKnc='
      @consent_form.email = encrypted_email
      @consent_form.email.should == 'kemba.walker@aol.com'
    end
  end
end
