require 'spec_helper'

describe Api::TasksController do

  let!(:user) { FactoryGirl.create(:user, login: "test") }

  describe "GET index" do
    before do
      @task1 = FactoryGirl.create(:task, user: user)
      @task2 = FactoryGirl.create(:task, user: user)
      @task_from_another_user = FactoryGirl.create(:task)
    end

    it "should request user to be logged in or api_token" do
      get :index
      response.code.to_s.should == "401"
    end

    it "should return user tasks" do
      get :index, {api_key: user.api_key, user_login: user.login}
      json = JSON.parse(response.body)
      json.map { |m| m["id"] }.should include(@task1.id)
    end

    it "should not return tasks from other users" do
      get :index, {api_key: user.api_key, user_login: user.login}
      json = JSON.parse(response.body)
      json.map { |m| m["id"] }.should_not include(@task_from_another_user.id)
    end
  end

  describe "POST create" do
    it "should create task" do
      expect {
        post :create, {api_key: user.api_key, user_login: user.login, task: {name: "test"}}
      }.to change(Task, :count).by(1)
    end
  end

  describe "POST update" do
    before do
      @task = FactoryGirl.create(:task, user: user)
    end

    it "should update task data" do
      post :update, {api_key: user.api_key, user_login: user.login, id: @task.id, task: {name: "changed", completed: true, priority: 3}}
      @task.reload
      @task.name.should == "changed"
      @task.completed.should == true
      @task.priority.should == 3
    end
  end

  describe "DELETE destroy" do
    before do
      @task = FactoryGirl.create(:task, user: user)
    end

    it "destroys task" do
      expect {
        delete :destroy, {api_key: user.api_key, user_login: user.login, id: @task.id}
      }.to change(Task, :count).by(-1)
    end
  end

end