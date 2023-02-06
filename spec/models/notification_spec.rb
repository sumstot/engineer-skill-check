require 'rails_helper'

RSpec.describe Notification, type: :mvc_type do
  describe '#create' do
    it 'should save with title and body' do
      notification = Notification.create(title: 'Title', body: 'Testing the model body. We need more than 30 charaters.')
      expect(notification).to eq(true)
    end

    it 'Does not save when the body is less than 30 charcaters' do
      notification = Notification.create(title: 'Title', body: 'Testing the model body.')
      expect(notification).to eq('30文字以上入力してください')
    end
  end
end
