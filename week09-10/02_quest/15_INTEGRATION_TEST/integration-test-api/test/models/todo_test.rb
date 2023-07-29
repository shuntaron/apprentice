require "test_helper"

class TodoTest < ActiveSupport::TestCase
  # TODO タスクのタイトルが空だった場合、バリデーションエラーになる
  test "empty title should raise validation error" do
    todo = Todo.new(title: "")
    assert_not todo.valid?
    assert_includes todo.errors[:title], "can't be blank"
  end
  
  # TODO タスクのタイトルが入力されていた場合、バリデーションエラーにならない
  test "title should not raise validation error" do
    todo = Todo.new(title: "test")
    assert todo.valid?
  end
end
