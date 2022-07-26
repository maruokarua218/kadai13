require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
describe '管理画面のテスト' do
  before do
    FactoryBot.create(:user)
  end
  context '管理ユーザ登録' do
    it '管理画面にアクセスできる' do
      visit new_session_path
      fill_in 'email', with: 'aa@gmail.com'
      fill_in 'password', with: 'aadayo'
      click_on 'Log in'
      click_on 'ユーザー管理画面'
      expect(current_path).to eq admin_users_path
    end
  end
  context '管理ユーザ登録' do
    it 'ユーザーの新規登録ができる' do
      visit new_session_path
      fill_in 'email', with: 'aa@gmail.com'
      fill_in 'password', with: 'aadayo'
      click_on 'Log in'
      click_on 'ユーザー管理画面'
      click_on 'ユーザーの作成'
      fill_in 'Namae', with:'qq'
      fill_in 'Email', with: 'qq@gmail.com'
      fill_in 'Password', with: 'qqdayo'
      fill_in 'Password confirmation', with: 'qqdayo'
      click_on 'Create my account'
      expect(page).to have_content 'qqのページ'
      expect(page).to have_content 'qq@gmail.com'
    end
  end
