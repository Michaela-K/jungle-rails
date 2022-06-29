require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    # validation :email, :first name, :last name, :password, :password_confirmation, presence: true
    it "user has all four fields present" do
      @user = User.new(firstname: "Rose", lastname: "Nylund", email: "rosenylund@gmail.com", password: 'password',password_confirmation:'password' )
      expect(@user).to have_attributes(:firstname => "Rose", :lastname => "Nylund", :email => "rosenylund@gmail.com", :password => 'password',:password_confirmation =>'password')
    end

    #validation if :password and password_confirmation fields dont match
    it "ensure password and password_confirmation fields dont match" do
      @user = User.new(password: 'password',password_confirmation:'password' )
      expect(@user.password).to eql(@user.password_confirmation)
    end

    #emails must be unique(not case sensitive) therefore no duplicates
    it "ensures emails are not duplicated" do
      @user = User.new(email: "rosenylund@gmail.com")
      @invalid_user = @user.dup   # dup is a “shallow” copy as it copies the object's attributes only
      @invalid_user.email = "ROSENYLUND@GMAIL.COM"
      
      #!!!@invalid_user.valid? returns falsey in the terminal -> how does it know? - because it only copied the attributes and nothing more like id, timestamps etc?
      expect(@invalid_user.valid?).to be_falsey  #valid? -> Returns true if no errors are found, false otherwise.
      expect(@invalid_user.errors.full_messages[0]).to match("Password can't be blank")                                                                          
    end

    #password min length when account being created 
    it "validates password length" do
      @user = User.new(password: "rose")
      expect(@user.valid?).to be_falsey
    end

    #password and password_confirmation required when making a model
  end


  describe '.authenticate_with_credentials' do
    it 'should validate emails with spaces before/after' do
      @user = User.new(:email => '  rose@gmail.com  ')
      @user[:email].strip!

      expect(@user).to have_attributes(:email => 'rose@gmail.com')
    end

    it "should validate when email is in the wrong case" do
      @user = User.new(:email => 'rOse@gmail.cOm', :password => 'password')
      @user.save

      expect(@user.email).to be_valid
    end

    it "should not validate when email and password don't match" do
      @user = User.new(:email => 'rose@gmail.com', :password => 'password')

      expect(@user).to_not have_attributes(:email => nil, :password => nil)
    end

  end



end
