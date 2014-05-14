require 'spec_helper'

describe User do
  it { should have_secure_password }
  context('#validations') do 
    it { should validate_presence_of :email }
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :password }
    it { should validate_presence_of :password_confirmation }
    it { should ensure_length_of(:password).is_at_least(6).is_at_most(40) }
    it { should allow_value("test@test.com").for :email}
    it { should_not allow_value("qlskr.com","teae@sa",12).for :email}
  end
end