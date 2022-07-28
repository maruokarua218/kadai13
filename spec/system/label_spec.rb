require 'rails_helper'
RSpec.describe 'ラベル管理機能', type: :system do
  let!(:label) { FactoryBot.create(:label) }
  let!(:second_label) { FactoryBot.create(:second_label) }
  let!(:user) { FactoryBot.create(:user) }

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it 'ラベルも一緒に作成される' do
        visit new_session_path
        fill_in "session_email", with: 'qq@gmail.com'
        fill_in 'session_password', with: 'qqdayo'
        click_on 'Log in'
        visit new_task_path
        fill_in 'task_title', with: 'aa'
        fill_in 'task_content', with: 'aa'
        check 'テスト1'
        click_button '登録する'
        expect(page).to have_content 'テスト1'
      end
    end
  end

  context 'タスクを編集した場合' do
    it 'ラベルも一緒に編集される' do
      visit new_session_path
      fill_in "session_email", with: 'qq@gmail.com'
      fill_in 'session_password', with: 'qqdayo'
      click_on 'Log in'
      visit new_task_path
      fill_in 'task_title', with: 'aa'
      fill_in 'task_content', with: 'aa'
      check 'テスト1'
      click_button '登録する'
      click_on 'Edit'
      fill_in 'task_title', with: 'qq'
      fill_in 'task_content', with: 'qq'
      check 'テスト2'
      click_button '更新する'
      click_on 'Back'
      expect(page).to have_content 'テスト2'
    end
  end

  describe '一覧表示機能' do
    context 'ラベル検索をした場合' do
      it "ラベルに完全一致するラベルを表示する" do
        @task = FactoryBot.create(:task, user: user)
        visit new_session_path
        fill_in "session_email", with: 'qq@gmail.com'
        fill_in 'session_password', with: 'qqdayo'
        click_on 'Log in'
        visit tasks_path
        click_on 'Edit'
        check 'テスト1'
        click_button '更新する'
        click_on 'Back'
        select 'テスト1', from: 'label_id'
        click_on "search"
        expect(page).to have_content 'テスト1'
      end
    end
  end
end
