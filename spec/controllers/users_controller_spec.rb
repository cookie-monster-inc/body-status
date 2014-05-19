require 'spec_helper'

describe UsersController do
  let(:valid_params) do 
    { :user => attributes_for(:user) }
  end
  let(:invalid_params) do
    { :user => {} }
  end
  let!(:user) do 
    create :user
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

  context '#index' do
    it 'should exist' do
      get :index
      expect(response).to be_success
    end
  end

  context '#edit' do
    it 'should exist' do 
      get :edit, :id => user.id
      expect(response).to be_success
    end
  end

  context '#update' do
    let(:valid_edit_params) do
      {
        user: {
          first_name: 'This',
          last_name: 'guy',
          email: 'test@test.com',
          password: "password",
          password_confirmation: "password"
        },
        id: user.id
      }
    end

    let(:invalid_edit_params) do
      {
        user: {},
        id: user.id
      }
    end


    context 'with valid data' do
      it 'should update a user' do
        expect{
          put :update, valid_edit_params
          expect(response).to be_redirect
          }.to change { 
            # We build a hash of all the items that are supposed to change
            this_user = User.find(user.id)
            {
             first_name: this_user.first_name,
             last_name: this_user.last_name,
             email: this_user.email
            }
          }
      end
    end
    context 'with no password' do 
      it 'should not update a user, and print errors' do
        expect{
          put :update, invalid_edit_params
          expect(response).to_not be_redirect
          }.to_not change { 
            # We build a hash of all the items that are supposed to change
            this_user = User.find(user.id)
            {
             first_name: this_user.first_name,
             last_name: this_user.last_name,
             email: this_user.email
            }
          }
        end
    end
  end
end
