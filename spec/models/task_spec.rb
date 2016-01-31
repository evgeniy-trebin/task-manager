require 'rails_helper'

RSpec.describe Task, type: :model do


  describe '#validations' do

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:user_id) }
    it { should enumerize(:state).in(Task::STATE_NEW, Task::STATE_STARTED, Task::STATE_FINISHED).with_default(Task::STATE_NEW) }

    it 'must be valid' do
      task = build(:task)
      expect(task).to be_valid
    end
  end

  describe '#methods' do

    before(:each) do
      @task = create(:task)
      @started_task = create(:started_task)
      @finished_task = create(:finished_task)
    end

    it '#new?' do
      expect(@task.new?).to be_truthy
      expect(@started_task.new?).to be_falsey
      expect(@finished_task.new?).to be_falsey
    end

    it '#started?' do
      expect(@task.started?).to be_falsey
      expect(@started_task.started?).to be_truthy
      expect(@finished_task.started?).to be_falsey
    end

    it '#finished?' do
      expect(@task.finished?).to be_falsey
      expect(@started_task.finished?).to be_falsey
      expect(@finished_task.finished?).to be_truthy
    end

    it '#can_be_started?' do
      expect(@task.can_be_started?).to be_truthy
      expect(@started_task.can_be_started?).to be_falsey
      expect(@finished_task.can_be_started?).to be_falsey
    end

    it '#can_be_finsihed?' do
      expect(@task.can_be_finished?).to be_falsey
      expect(@started_task.can_be_finished?).to be_truthy
      expect(@finished_task.can_be_started?).to be_falsey
    end

    it '#start' do

      @task.start
      expect(@task.state.to_sym).to eq(Task::STATE_STARTED)
      @started_task.start
      expect(@started_task.state_changed?).to be_falsey
      @finished_task.start
      expect(@finished_task.state.to_sym).to eq(Task::STATE_FINISHED)
    end

    it '#finish' do
      @task.finish
      expect(@task.state.to_sym).to eq(Task::STATE_NEW)
      @started_task.finish
      expect(@started_task.state.to_sym).to eq(Task::STATE_FINISHED)
      @finished_task.finish
      expect(@finished_task.state_changed?).to be_falsey
    end

  end

  describe '#state_machine' do

    before(:each) do
      @task = create(:task)
      @started_task = create(:started_task)
      @finished_task = create(:finished_task)
    end

    it 'must have state :new' do
      expect(@task.new?).to be_truthy
    end

    it 'changes state to :started' do
      @task.start
      expect(@task.started?).to be_truthy
    end

    it 'changes state to :finished' do
      @task.start
      @task.finish
      expect(@task.finished?).to be_truthy
    end

    it 'must be invalid with :state error' do
      @task.state = Task::STATE_FINISHED
      expect(@task).not_to be_valid
      expect(@task.errors.messages.size).to eq(1)
      expect(@task.errors.has_key?(:state)).to be_truthy

      @started_task.state = Task::STATE_NEW
      expect(@started_task).not_to be_valid
      expect(@started_task.errors.messages.size).to eq(1)
      expect(@started_task.errors.has_key?(:state)).to be_truthy

      @finished_task.state = Task::STATE_NEW
      expect(@finished_task).not_to be_valid
      expect(@finished_task.errors.messages.size).to eq(1)
      expect(@finished_task.errors.has_key?(:state)).to be_truthy

      @finished_task.state = Task::STATE_STARTED
      expect(@finished_task).not_to be_valid
      expect(@finished_task.errors.messages.size).to eq(1)
      expect(@finished_task.errors.has_key?(:state)).to be_truthy
    end

  end
end
