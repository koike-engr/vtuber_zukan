require 'rails_helper'

RSpec.describe Vtuber, type: :model do
  describe 'Model validation' do
    let(:vtuber) { FactoryBot.create(:vtuber) }
    it '正常なパラメータで登録することが有効であること' do
        expect(vtuber).to be_valid
    end

    it '名前が無いと無効であること' do
      vtuber.name = nil
      expect(vtuber).to_not be_valid
    end

    it '登録者数が無いと無効であること' do
      vtuber.subscribers = nil
      expect(vtuber).to_not be_valid
    end

    it 'スパチャ数が無いと無効であること' do
      vtuber.superchats = nil
      expect(vtuber).to_not be_valid
    end
  end
end
