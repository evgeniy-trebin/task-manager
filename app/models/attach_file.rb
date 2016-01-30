class AttachFile < ActiveRecord::Base

  belongs_to :task

  mount_uploader :file, AttachFileUploader

  validates_presence_of :name, :file, :task_id

end
