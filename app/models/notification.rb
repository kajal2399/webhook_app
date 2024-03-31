require 'net/http'
class Notification < ApplicationRecord
  validates :name, presence: true
  validates :data, presence: true

  after_save :notify_third_parties

  private

  def notify_third_parties
    NotificationService.new.notify_third_parties(self)
  end
end
  