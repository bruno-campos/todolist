require 'spec_helper'

describe User do

  describe "when creating a new user" do
    before do
      @user = FactoryGirl.create(:user)
    end

    it "should set the api_key value" do
      @user.api_key.should_not be_nil
    end
  end

end
