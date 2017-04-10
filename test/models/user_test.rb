require 'test_helper'

class UserTest < ActiveSupport::TestCase
   def setup 
   		@user = User.new(name: "snehal",email:"snehal@ahire@fh.com",password:"asd",password_confirmation: "asd")
   	end
   	
end
