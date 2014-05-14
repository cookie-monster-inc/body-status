class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :email, :first_name, :last_name, :password
  validates_length_of :password, :within => 6..40
  validates_format_of :email, :with => /^\w+[\.\w\-]*@\w+\.\w{2,5}$/
end