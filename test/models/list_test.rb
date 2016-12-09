require 'test_helper'

class ListTest < ActiveSupport::TestCase

	test "should not save list without title" do
	  list = List.new
	  assert_not list.save
	end

	test "should save list with title and url in slug" do
	  list = List.new(title: 'Cosas que dejé para mañana')
	  list.save
	  assert_equal('cosas-que-deje-para-manana', list.url)
	end

	test "should not save list that have same url" do
	  list = List.new(title: 'Cosas que dejé para mañana')
	  list.save
	  list = List.new(title: 'Cosas que dejé para mañana')
	  assert_not list.save
	end
end
