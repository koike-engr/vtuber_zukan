require 'rails_helper'

RSpec.describe "Vtubers", type: :request do
  describe "index: GET /vtubers" do
    before do
      FactoryBot.create(:vtuber)
    end
    it "リクエストが成功すること" do
      get vtubers_path
      expect(response).to have_http_status(200)
    end

    it '作成済みVtuberの名前が表示されていること' do
      get vtubers_path
      expect(response.body).to include "社築"
    end

    it '作成済みVtuberの登録者数が表示されていること' do
      get vtubers_path
      expect(response.body).to include "39.5万人"
    end

    it '作成済みVtuberのスパチャ数が、正しく桁区切りされて表示されていること' do
      get vtubers_path
      expect(response.body).to include "23,612,673円"
    end
  end

  describe 'create: POST /vtubers' do
    context 'パラメータが有効な場合' do
      it 'リクエストが成功すること' do
        post vtubers_path, params: { vtuber: FactoryBot.attributes_for(:vtuber) }
        expect(response).to have_http_status(302)
      end
    end

    context 'パラメータが無効な(名前の入力が無い)場合' do
      it '再レンダリングのリクエストが成功すること' do
        post vtubers_path, params: { vtuber: FactoryBot.attributes_for(:vtuber, :without_name) }
        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'new: GET /vtubers/new' do
    it 'リクエストが成功すること' do
      get new_vtuber_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'edit: GET /vtubers/:id/edit' do
    let(:vtuber) { FactoryBot.create(:vtuber) }
    it 'リクエストが成功すること' do
      get edit_vtuber_path(vtuber)
      expect(response).to have_http_status(200)
    end

    it '編集前のattributesが表示されていること' do
      get edit_vtuber_path(vtuber)
      # 名前
      expect(response.body).to include "#{vtuber[:name]}"
      # 登録者数
      expect(response.body).to include "#{vtuber[:subscribers]}"
      # スパチャ数
      expect(response.body).to include "#{vtuber[:subscribers]}"
    end
  end

  describe 'show: GET /vtubers/:id' do
    let(:vtuber) { FactoryBot.create(:vtuber) }
    it 'リクエストが成功すること' do
      get vtuber_path(vtuber)
      expect(response).to have_http_status(200)
    end

    it '編集前のattributesが表示されていること' do
      get vtuber_path(vtuber)
      # 名前
      expect(response.body).to include "#{vtuber[:name]}"
      # 登録者数
      expect(response.body).to include "#{vtuber[:subscribers]}"
      # スパチャ数
      expect(response.body).to include "#{vtuber[:subscribers]}"
    end
  end

  describe 'update: PATCH /vtubers/:id' do
    let(:vtuber) { FactoryBot.create(:vtuber) }
    context 'パラメータが有効な場合' do
      it 'リクエストが成功すること' do
        patch vtuber_path(vtuber), params: { vtuber: FactoryBot.attributes_for(:kuzuha) }
        expect(response).to have_http_status(302)
      end
    end

    context 'パラメータが無効な(名前の入力が無い)場合' do
      it '再レンダリングのリクエストが成功すること' do
        patch vtuber_path(vtuber), params: { vtuber: FactoryBot.attributes_for(:kuzuha, :without_name) }
        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'destroy: DELETE /vtubers/:id' do
    let(:vtuber) { FactoryBot.create(:vtuber) }
    it 'リクエストが成功すること' do
      delete vtuber_path(vtuber)
      expect(response).to have_http_status(302)      
    end
  end
end
