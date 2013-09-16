
require 'spec_helper'

describe Api::SessionsController do

  let!(:user) { FactoryGirl.create(:user, login: "test") }

  describe "POST create" do
    describe "with invalid info" do
      it "should return error" do
        post :create, {login: user.login, password: "111"}
        json = JSON.parse(response.body)
        json["success"].should == false
      end
    end

    describe "with valid info" do
      it "should log user" do
        post :create, {login: user.login, password: "123456"}
        json = JSON.parse(response.body)
        json["success"].should == true
      end
    end
  end

end