require 'spec_helper'

describe UsersController do
  let(:valid_params) do 
    { :user => attributes_for(:user) }
  end
  let(:invalid_params) do
    { :user => {} }
  end

  context '#new' do 
    it 'should exist' do 
      get :new
      expect(response).to be_success
    end
  end

  context '#create' do 
    it "should create an User and redirect when params are valid" do
      expect{
        post :create, valid_params
        expect(response).to be_redirect
        }.to change { User.count }.by 1
    end
    it "should NOT create an User and redirect when params are INvalid" do
      expect{
        post :create, invalid_params
        expect(response).not_to be_redirect
        }.not_to change { User.count }
    end
  end
end