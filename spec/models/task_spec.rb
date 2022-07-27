require 'rails_helper'
describe 'タスクモデル機能', type: :model do
  let!(:user) { FactoryBot.create(:user) }
  describe 'バリデーションのテスト' do
    context 'タスクのタイトルが空の場合' do
      it 'バリデーションにひっかる' do
        task = Task.new(title: '', content: '失敗テスト', user: user)
        expect(task).not_to be_valid
      end
    end
      context 'タスクの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        task = Task.new(title: '失敗テスト', content: '', user: user)
      end
    end
    context 'タスクのタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        task = Task.new(title: '成功テスト', content: '成功テスト', user: user)
      end
    end
    let!(:task) { FactoryBot.create(:task, title: 'aa', user: user) }
    let!(:second_task) { FactoryBot.create(:second_task, title: "sample", user: user) }
    context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      it "検索キーワードを含むタスクが絞り込まれる" do
        expect(Task.search_title('aa')).to include(task)
        expect(Task.search_title('aa')).not_to include(second_task)
        expect(Task.search_title('aa').count).to eq 1
      end
    end
    let!(:task) { FactoryBot.create(:task, status: '完了', user: user) }
    context 'scopeメソッドでステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        expect(Task.search_status('完了')).to include(task)
        expect(Task.search_status('完了').count).to eq 1
      end
    end
    let!(:task) { FactoryBot.create(:task, title: 'aa', status: '完了', user: user) }
    let!(:second_task) { FactoryBot.create(:second_task, title: "sample", user: user) }
    context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        expect(Task.search_title('aa')).to include(task)
        expect(Task.search_title('aa')).not_to include(second_task)
        expect(Task.search_title('aa').count).to eq 1
        expect(Task.search_status('完了')).to include(task)
        expect(Task.search_status('完了').count).to eq 1
      end
    end
  end
end
