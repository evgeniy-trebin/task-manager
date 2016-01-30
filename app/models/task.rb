class Task < ActiveRecord::Base

  extend Enumerize

  belongs_to :user

  STATE_NEW = :new
  STATE_STARTED = :started
  STATE_FINISHED = :finished

  enumerize :state, in: [STATE_NEW, STATE_STARTED, STATE_FINISHED], default: STATE_NEW, predicates: {prefix: true}

  validates_presence_of :name, :state, :user_id

  validate :check_state_change, if: :should_check_state_change?

  scope :sorted, ->() { order(created_at: :desc) }

  def new?
    state_new?
  end

  def started?
    state_started?
  end

  def finished?
    state_finished?
  end

  def can_be_started?
    state_new?
  end

  def can_be_finished?
    state_started?
  end

  def start
    return false unless can_be_started?
    self.state = STATE_STARTED
    save
  end

  def finish
    return false unless can_be_finished?
    self.state = STATE_FINISHED
    save
  end

  private

  def should_check_state_change?
    state_changed? && state_was.present?
  end

  def check_state_change
    it_has_error = case state.to_sym
                     when STATE_NEW
                       true if state.present? && [STATE_STARTED, STATE_FINISHED].include?(state_was.to_sym)
                     when STATE_STARTED
                       true unless state_was.to_sym == STATE_NEW
                     when STATE_FINISHED
                       true unless state_was.to_sym == STATE_STARTED
                     else
                       false
                   end
    errors.add(:state, :cant_be_changed) if it_has_error
  end

end
