require 'spec_helper'

describe Api::UsersController do

  describe "POST create" do
    describe "with invalid info" do
      it "should not create user" do
        expect { post :create, user: {login: "test"} }.to_not change(User, :count)
      end

      it "should return errors" do
        post :create, user: {login: "test"}
        response.code.to_s.should == "422"
      end
    end

    describe "with valid info" do
      it "should create the user" do
        expect {
          post :create, {user: {login: "test", password: "123456", password_confirmation: "123456"}}
        }.to change(User, :count).by(1)
      end

      it "should return user data" do
        post :create, {user: {login: "test", password: "123456", password_confirmation: "123456"}}
        json = JSON.parse(response.body)
        json["login"].should == "test"
      end
    end
  end

end