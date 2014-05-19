require 'spec_helper'

describe SessionsController do 
  context '#new' do
    it 'should exist' do
      get :new
      expect(response).to be_success
    end
  end
end