require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user=User.new(name: "Example User", phone: "04000000000", email: "user@example.com", encrypted_password: "foo", post_code: "3004",  about: "about", business: "Sole Trader", business_type: "Air conditioning Specialist")
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  test "name should be present" do
    @user.name="    "
    assert_not @user.valid?
  end
  
  test "name should not be too long" do
    @user.name="a"*51;
    assert_not @user.valid?
  end
  
  test "phone should be present" do
    @user.phone="   "
    assert_not @user.valid?
  end 
  
  test "phone validation should reject invalid phone number" do
    invalid_phone=%w[04000 61400000000 0000000000 aaaaaaaaa]
    invalid_phone.each do |invalid_phone|
      @user.phone=invalid_phone
      assert_not @user.valid?, "#{invalid_phone.inspect} should be invalid"
    end
  end
    
  test "about should be present" do
    @user.about="    "
    assert_not @user.valid?
  end
  
  test 'should generate a hashed password while setting password' do
    user=new_user
    assert_present user.encrypted_password
  end
  
  test 'should not generate a hashed passowrd if password is blank' do
    assert_blank new_user(password: nil).encrypted_password
    assert_blank new_user(password: '').encrypted_password
  end

  test "post code should be provided" do
    @user.post_code=" "*4
    assert_not @user.valid?
  end

  test "post code should be valid" do
      invalid_post_code=%w[aaaa 00000 00 0000]
      invalid_post_code.each do |invalid_post_code|
        @user.post_code=invalid_post_code
        assert_not @user.valid? "#{invalid_post_code} should be invalid"
      end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses=%w[user@example,com user_at_foo.org user.name@example.foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email=invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect}should be invalid"
    end
  end

  test "email should be present" do
    @user.email="   "
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email="a"*244+"@example.com"
    assert_not @user.valid?
  end

  test "email addresses should be unique" do
    duplicate_user=@user.dup
    duplicate_user.email=@user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
end
