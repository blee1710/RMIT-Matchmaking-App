require 'test_helper'

class WorkerTest < ActiveSupport::TestCase
  def setup
    @worker=User.new(name: "Example Worker", last_name: "Example", phone: "0400000000", post_code: "3000", email: "user@example.com", business: "", business_type: "")
  end

  test "worker should be valid" do
    assert @worker.valid?
  end

  test "name should be provided" do
    @worker.name="    "
    assert_not @worker.valid?
  end

  test "last name should be provided" do
    @worker.name="   "
    assert_not @worker.valid?
  end

  test "phone should be provided" do
    @worker.phone="   "
    assert_not @worker.valid?
  end

  test "phone validation should reject invalid phone number" do
    invalid_phone=%w[04000 61400000000 0000000000 aaaaaaaaa]
    invalid_phone.each do |invalid_phone|
      @worker.phone=invalid_phone
      assert_not @worker.valid?, "#{invalid_phone.inspect} should be invalid"
    end
  end

  test "post code should be provided" do
    @worker.post_code=" "*4
    assert_not @worker.valid?
  end

  test "post code should be valid" do
    invalid_post_code=%w[aaaa 00000 00]
    invalid_post_code.each do |invalid_post_code|
      @worker.post_code=invalid_post_code
      assert_not @worker.valid? "#{invalid_post_code} should be invalid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses=%w[user@example,com user_at_foo.org user.name@example.foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @worker.email=invalid_address
      assert_not @worker.valid?, "#{invalid_address.inspect}should be invalid"
    end
  end

  test "email should be present" do
    @worker.email="   "
    assert_not @worker.valid?
  end

  test "email should not be too long" do
    @worker.email="a"*244+"@example.com"
    assert_not @worker.valid?
  end

  test "email addresses should be unique" do
    duplicate_worker=@worker.dup
    duplicate_worker.email=@worker.email.upcase
    @worker.save
    assert_not duplicate_worker.valid?
  end

  
end
