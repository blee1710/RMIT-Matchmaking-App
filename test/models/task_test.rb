require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  
  def setup
    @task=Task.new(title: "title", description: "description", skills: "Air Conditioning Repairs")
  end

  test "should be valid" do
    assert @task.valid?
  end

  test "title should be present" do
    @task.title=" "
    assert_not @task.valid?
  end

  test "title should not be too long" do
    @task.title="a"*51
    assert_not @task.valid?
  end

  test "description should be present" do
    @task.description="  "
    assert_not @task.valid?
  end

  test "description should not be too long" do
    @task.description="a"*401
    assert_not @task.valid?
  end
end
