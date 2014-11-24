require 'spec_helper'

describe FieldDecrypter do
  before :all do
    FieldDecrypter::PrivateKeyFilepath = "#{Rails.root}/spec/resources/private.pem"
  end
  
  it "should correctly decrypt a message" do
    encrypted = "RC78JOorP4EKyuh3Bh9atg==::iiaRmPaoFbke5d81FkL5SgQYudtnV2rl370QVlJel0f2+IniSugQ359gvsTqT2YPg1JcZ+9eky9GLGoDdAX90jsqYBG3CnawS6FgHNfO2HxBxTcgTWgfRmZv1lLo4JJ423lVXMdQv2mxgBTTMMO1ZNJsHtDjOoKlTGPh1lL3DARRrkz67J8LKN/zGDMIQXr9kfag/qkCJgJB36Owsj+9qIKKrzxtznsp/t8/Q2JGaKJmvh0srKr35hXJ6+cucI/+2uhEE78oKadUTyxxzgKrrmhKkKW2TvO4BPRsA7kpU6/X44UYYxQ2eqiMrhvklbzZKgtOuk84LZg4gXi9zCc80g==::gPYO7iDShmrk+RzO5ydjMfSUizmVEA6dAdrpsLeZvqI="
    FieldDecrypter.decrypt(encrypted).should == "Hello out there!"
  end
end
