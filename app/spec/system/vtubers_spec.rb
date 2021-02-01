require 'rails_helper'

RSpec.describe "Vtubers", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'system: new->show->index' do
    context 'パラメータが有効な場合' do
      it '詳細ページへリダイレクトされ、詳細ページとindexページに入力した情報が反映されている' do
        # new
        visit new_vtuber_path
        fill_in '名前', with: FactoryBot.attributes_for(:vtuber)[:name]
        fill_in 'チャンネル登録者数', with: FactoryBot.attributes_for(:vtuber)[:subscribers]
        fill_in '累計スパチャ額', with: FactoryBot.attributes_for(:vtuber)[:superchats]
        click_button '送信'
        # create->show
        expect(current_path).to eq "/vtubers/#{Vtuber.last.id}"
        expect(page).to have_content "追加できました!"
        expect(page).to have_content FactoryBot.attributes_for(:vtuber)[:name]
        expect(page).to have_content FactoryBot.attributes_for(:vtuber)[:subscribers]
        expect(page).to have_content FactoryBot.attributes_for(:vtuber)[:superchats].to_s(:delimited)
        # index
        click_link '一覧へ戻る'
        expect(page).to have_content FactoryBot.attributes_for(:vtuber)[:name]
        expect(page).to have_content FactoryBot.attributes_for(:vtuber)[:subscribers]
        expect(page).to have_content FactoryBot.attributes_for(:vtuber)[:superchats].to_s(:delimited)
      end
    end

    context 'パラメータが無効な(名前の入力が無い)場合' do
      it '新規作成ページへリダイレクトする' do
        visit new_vtuber_path
        fill_in 'チャンネル登録者数', with: FactoryBot.attributes_for(:vtuber)[:subscribers]
        fill_in '累計スパチャ額', with: FactoryBot.attributes_for(:vtuber)[:superchats]
        click_button '送信'
        expect(current_path).to eq new_vtuber_path
        expect(page).to have_content "作成に失敗しました。未入力の項目があります。"
      end
    end
  end

  describe 'system: edit->show->index' do
    let(:vtuber) { FactoryBot.create(:vtuber) }
    context 'パラメータが有効な場合' do
      it '詳細ページへリダイレクトされ、詳細ページとindexページに入力した情報が反映されている' do
        # edit
        visit edit_vtuber_path(vtuber)
        fill_in '名前', with: FactoryBot.attributes_for(:kuzuha)[:name]
        fill_in '登録者数', with: FactoryBot.attributes_for(:kuzuha)[:subscribers]
        fill_in '累計スパチャ額', with: FactoryBot.attributes_for(:kuzuha)[:superchats]
        click_button '送信'
        # update->show
        expect(current_path).to eq vtuber_path(vtuber)
        expect(page).to have_content "変更できました!"
        expect(page).to have_content FactoryBot.attributes_for(:kuzuha)[:name]
        expect(page).to have_content FactoryBot.attributes_for(:kuzuha)[:subscribers]
        expect(page).to have_content FactoryBot.attributes_for(:kuzuha)[:superchats].to_s(:delimited)
        # index
        click_link '一覧へ戻る'
        expect(page).to have_content FactoryBot.attributes_for(:kuzuha)[:name]
        expect(page).to have_content FactoryBot.attributes_for(:kuzuha)[:subscribers]
        expect(page).to have_content FactoryBot.attributes_for(:kuzuha)[:superchats].to_s(:delimited)
      end    
    end

    context 'パラメータが無効な(名前の入力が無い)場合' do
      it '更新ページへリダイレクトする' do
        visit edit_vtuber_path(vtuber)
        fill_in '名前', with: nil
        fill_in '登録者数', with: FactoryBot.attributes_for(:kuzuha)[:subscribers]
        fill_in '累計スパチャ額', with: FactoryBot.attributes_for(:kuzuha)[:superchats]
        click_button '送信'
        expect(current_path).to eq edit_vtuber_path(vtuber)
        expect(page).to have_content "変更に失敗しました。未入力の項目があります。"
      end
    end
  end

  describe 'system: destroy->index' do
    let(:vtuber) { FactoryBot.create(:vtuber) }
    it 'indexからも削除されていること' do
      visit vtuber_path(vtuber)
      click_link '削除する'
      expect(current_path).to eq vtubers_path
      expect(page).to_not have_content(vtuber[:name])
    end
  end
end
