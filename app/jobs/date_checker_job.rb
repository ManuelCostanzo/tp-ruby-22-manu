class DateCheckerJob < ApplicationJob
  queue_as :default

  def perform(list)
    list.tasks.temporary.each do |task|

        task.update_attributes status_id: 3 if task.ending < DateTime.now
    end 
  end
end
