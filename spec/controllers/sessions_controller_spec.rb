require 'spec_helper'

describe SessionsController do 
  let!(:user) {
    create :user
  }
  let(:valid_login_params){
    {
      :email => user.email,
      :password => user.password
    }
  }

  context '#new' do
    it 'should exist' do
      get :new
      expect(response).to be_success
    end
  end

  context '#create' do 
    context 'with valid data' do
      it 'should log an user in' do 
        expect {
          post :create, valid_login_params
          expect(response).to be_redirect
        }.to change { request.session[:user_id] }.to user.id
      end
    end
    context 'with invalid data' do 
      it 'should not log me in or redirect' do 
        expect { 
          post :create, {}
          expect(response).not_to be_redirect
        }.not_to change { request.session[:user_id] }
      end
    end
  end

  context '#destroy' do 
    it 'should log me out' do 
      request.session[:user_id] = user.id
      expect {
        delete :destroy, :id => user.id
        expect(response).to be_redirect
      }.to change { request.session[:user_id] }.to nil
    end
  end
end