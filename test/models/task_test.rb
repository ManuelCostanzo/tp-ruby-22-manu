require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  setup do
    @list_one = lists(:list_one)
    @list_two = lists(:list_two)
  end

	def hash_temporary_task(beg=DateTime.now, endi=DateTime.now + 1.minutes)
		{type: 'Temporary', description: 'miii', priority_id: 1, beginning: beg, ending: endi, list_id: 1}
	end

	def hash_simple_long_task(type)
		{type: type, description: 'miii', priority_id: 1, list_id: 1}
	end

	test "should not save simple task without datas" do
	  simple = Simple.new
	  assert_not simple.save
	end

	test "should not save temporary task without datas" do
	  temporary = Temporary.new
	  assert_not temporary.save
	end

	test "should not save long task without datas" do
	  long = Long.new
	  assert_not long.save
	end

	test "should save simple task" do
	  simple = Simple.new(hash_simple_long_task('Simple'))
	  assert simple.save
	end

	test "should save temporary task" do
	  temporary = Temporary.new(hash_temporary_task)
	  assert temporary.save
	end

	test "should save long task" do
	  long = Long.new(hash_simple_long_task('Long'))
	  assert long.save
	end

	test "should order by priority using same types" do
	  assert_equal([1, 2, 3], @list_one.tasks.ids)
	end

	test "should order by priority using diferent types" do
	  assert_equal([5, 6, 4], @list_two.tasks.ids)
	end

	test "should not save temporary task with inverted dates" do
	  temporary = Temporary.new(hash_temporary_task('2016-12-08 23:43:12', '2016-12-08 23:41:12'))
	  assert_not temporary.save
	end

	test "should not update long task with percentage out of range" do
		long = Long.first
	  long.update_attributes status_id: 2
	  assert_not long.update_attributes percentage: 101
	end

	test "should update long task with percentage in range" do		
		long = Long.first
	  long.update_attributes status_id: 2
	  assert long.update_attributes percentage: 100
	end

end
