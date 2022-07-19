require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  before do
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in 'task_title', with: 'aa'
        fill_in 'task_content', with: 'aa'
        click_button '登録する'
        expect(page).to have_content 'aa'
      end
    end
  end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        task = FactoryBot.create(:task, title: 'task')
        visit tasks_path
        expect(page).to have_content 'task'
      end
    end
  end

    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
       visit tasks_path
       task_test = all('td').first
       expect(task_test).to have_content 'test_title'
      end
    end

    context '終了期限でソートするボタンを押した場合' do
      it '終了期限が遅いタスクが一番上に表示される' do
       FactoryBot.create(:task, title: 'first', deadline: Date.today)
       FactoryBot.create(:task, title: 'second', deadline: Date.today + 1.days)
       visit tasks_path
       click_on '終了期限'
       sleep(0.5)
       task_list = all('td').first
       expect(task_list).to have_content 'second'
      end
    end
    context '優先順位でソートするボタンを押した場合' do
      it '優先順位が高いタスクが一番上に表示される' do
       FactoryBot.create(:task, title: 'first', priority: '低' )
       FactoryBot.create(:task, title: 'second', priority: '高' )
       visit tasks_path
       click_on '優先度'
       sleep(0.5)
       task_list = all('td').first
       expect(task_list).to have_content 'second'
      end
    end

  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
         @task = FactoryBot.create(:task, title: 'aa', content: 'aa')
         visit task_path(@task.id)
         expect(page).to have_content 'aa'
       end
     end
  end
  context 'タイトルであいまい検索をした場合' do
    it "検索キーワードを含むタスクで絞り込まれる" do
      @task = FactoryBot.create(:task, title: 'aa', content: 'aa')
      visit tasks_path
      fill_in 'search', with: 'aa'
      click_on "検索"
      expect(page).to have_content 'aa'
    end
  end
  context 'ステータス検索をした場合' do
    it "ステータスに完全一致するタスクが絞り込まれる" do
      @task = FactoryBot.create(:task, status: '完了')
      visit tasks_path
      select '完了', from: 'status'
      click_on "検索"
      expect(page).to have_content '完了'
    end
  end
  context 'タイトルのあいまい検索とステータス検索をした場合' do
    it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
      @task = FactoryBot.create(:task, title: 'aa', content: 'aa', status: '完了')
      visit tasks_path
      fill_in 'search', with: 'aa'
      select '完了', from: 'status'
      click_on "検索"
      expect(page).to have_content 'aa'
      expect(page).to have_content '完了'
    end
  end
end
