require 'test_helper'

class DateCheckerJobTest < ActiveJob::TestCase
  setup do
  	@list_tree = lists(:list_tree)
  end

  test 'should update task that have expired dates' do
    DateCheckerJob.perform_now(@list_tree)
    assert_equal(0, @list_tree.tasks.pending.count)
    assert_equal(1, @list_tree.tasks.expired.count)
  end
end
