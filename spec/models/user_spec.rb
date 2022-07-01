require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    # validation :email, :first name, :last name, :password, :password_confirmation, presence: true
    it "user has all four fields present" do
      @user = User.new(firstname: "Rose", lastname: "Nylund", email: "rosenylund@gmail.com", password: 'password',password_confirmation:'password' )
      expect(@user).to have_attributes(:firstname => "Rose", :lastname => "Nylund", :email => "rosenylund@gmail.com", :password => 'password',:password_confirmation =>'password')
    end

    #password and password_confirmation required when making a model
    it "ensure password and password_confirmation required" do
     @user = User.new(email: "rosenylund@gmail.com", password: 'password',password_confirmation:nil )
     expect(@user.valid?).to be_falsey
     expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    #validation if :password and password_confirmation fields dont match
    it "ensure password and password_confirmation fields match" do
      @user = User.new(password: 'password',password_confirmation:'password' )
      expect(@user.password).to eql(@user.password_confirmation)
    end

    #emails must be unique(not case sensitive) therefore no duplicates
    it "ensures emails are not duplicated" do
      @user = User.new(email: "rosenylund@gmail.com", password: 'password',password_confirmation:'password')
      @user.save

      @invalid_user = @user.dup   # dup is a “shallow” copy as it copies the object's attributes only
      @invalid_user.email.upcase!
      @invalid_user.save
  
      expect(@invalid_user).not_to be_valid  #valid? -> Returns true if no errors are found, false otherwise.
      expect(@invalid_user.errors.full_messages).to include("Email has already been taken")                                                                          
    end

    #password min length when account being created 
    it "validates password length" do
      @user = User.new(password: "rose")
      expect(@user.valid?).to be_falsey
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end
  end


  describe '.authenticate_with_credentials' do
    it 'should validate emails with spaces before/after' do
      @user = User.new(:email => '  rose@gmail.com  ')
      @user[:email].strip!

      expect(@user).to have_attributes(:email => 'rose@gmail.com')
    end

    # it "should validate when email is in the wrong case" do
    #   @user = User.new(:email => 'rOse@gmail.cOm', :password => 'password')
    #   @user.save

    #   expect(@user.email).to be_valid
    # end

    it "should not validate when email and password don't match" do
      @user = User.new(:email => 'rose@gmail.com', :password => 'password')

      expect(@user).to_not have_attributes(:email => nil, :password => nil)
    end

  end



end
