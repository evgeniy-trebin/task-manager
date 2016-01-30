require 'rails_helper'

RSpec.describe AttachFile, type: :model do

  it { should validate_presence_of :name }
  it { should validate_presence_of :file }
  it { should validate_presence_of :task_id }

end
