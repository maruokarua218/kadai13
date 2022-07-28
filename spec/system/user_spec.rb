require 'rails_helper'
RSpec.describe 'ユーザー登録・セッション機能・管理画面のテスト', type: :system do
  describe 'ユーザー登録のテスト' do
    context 'ユーザーが登録がなく、ログインしていない場合' do
      it 'ユーザーが新規登録をすれば、詳細画面に移動する' do
        visit new_user_path
        fill_in 'user_name', with: 'qq'
        fill_in 'user_email', with: 'qq@gmail.com'
        fill_in 'user_password', with: 'qqdayo'
        fill_in 'user_password_confirmation', with: 'qqdayo'
        click_on 'Create my account'
        expect(page).to have_content 'qq'
      end
    end
    context 'ユーザーがログインせずにタスク一覧へ飛んだとき' do
      it '​ログイン画面に遷移する​' do
        visit tasks_path
        expect(current_path).to eq new_session_path
      end
    end
  end
  describe 'セッション機能のテスト' do
      before do
        @user = FactoryBot.create(:user)
        @second_user = FactoryBot.create(:second_user)
      end
      context 'アカウント登録済みのユーザがログインしようとした場合' do
        it 'ログインできる' do
          visit new_session_path
          fill_in 'session_email', with: 'qq@gmail.com'
          fill_in 'session_password', with: 'qqdayo'
          click_button 'Log in'
          expect(current_path).to eq user_path(@user)
        end
        it '自分の詳細画面に飛べること' do
          visit new_session_path
          fill_in 'session_email', with: 'qq@gmail.com'
          fill_in 'session_password', with: 'qqdayo'
          click_button 'Log in'
          expect(current_path).to eq user_path(@user)
        end

        it '一般ユーザーが他人の詳細画面に飛ぶと、タスク一覧画面に遷移する' do
          visit new_session_path
          fill_in 'session_email', with: 'qq@gmail.com'
          fill_in 'session_password', with: 'qqdayo'
          click_button 'Log in'
          visit user_path(User.find(1))
          expect(current_path).to eq tasks_path
        end

        it 'ログアウトができる' do
          visit new_session_path
          fill_in 'session_email', with: 'qq@gmail.com'
          fill_in 'session_password', with: 'qqdayo'
          click_button 'Log in'
          click_on 'Logout'
          expect(page).to have_content 'ログアウトしました'
        end
      end
    end
    describe '管理画面のテスト' do
      before do
        @second_user = FactoryBot.create(:second_user)
        @user = FactoryBot.create(:user)
      end
      context '管理ユーザーが管理画面にアクセスしようとするとき' do
        it '管理画面にアクセスできる' do
          visit new_session_path
          fill_in 'session_email', with: 'aa@gmail.com'
          fill_in 'session_password', with: 'aadayo'
          click_button 'Log in'
          visit admin_users_path
          expect(page).to have_content 'aa'
        end
      end
      context '一般ユーザーが管理画面にアクセスしようとするとき' do
        it '自分のタスクを表示させる' do
          visit new_session_path
          fill_in 'session_email', with: 'qq@gmail.com'
          fill_in 'session_password', with: 'qqdayo'
          click_button 'Log in'
          visit admin_users_path
          expect(current_path).to eq tasks_path
        end
      end
      context '管理ユーザーがユーザー登録した場合' do
        it 'ユーザーの登録ができる' do
          visit new_session_path
          fill_in 'session_email', with: 'aa@gmail.com'
          fill_in 'session_password', with: 'aadayo'
          click_button 'Log in'
          visit new_admin_user_path
          fill_in 'user_name', with: 'tt'
          fill_in 'user_email', with: 'tt@gmail.com'
          fill_in 'user_password', with: 'ttdayo'
          fill_in 'user_password_confirmation', with: 'ttdayo'
          click_on 'Create my account'
          expect(page).to have_content 'tt'
        end
      end
      context '管理ユーザーがユーザーの詳細にアクセスした場合' do
        it 'ユーザーの詳細画面にアクセスできる' do
          visit new_session_path
          fill_in 'session_email', with: 'aa@gmail.com'
          fill_in 'session_password', with: 'aadayo'
          click_button 'Log in'
          visit admin_users_path
          visit user_path(1)
          expect(current_path).to eq user_path(1)
        end
      end
      context '管理ユーザーがユーザーの編集画面にアクセスした場合' do
        it 'ユーザーの編集ができる' do
          visit new_session_path
          fill_in 'session_email', with: 'aa@gmail.com'
          fill_in 'session_password', with: 'aadayo'
          click_button 'Log in'
          visit edit_admin_user_path(1)
          fill_in 'user_password', with: 'aadayo'
          fill_in 'user_password_confirmation', with: 'aadayo'
          click_button 'edit my account'
          expect(page).to have_content 'aa@gmail.com'
        end
      end
      context '管理ユーザーがユーザーを削除した場合' do
        it 'ユーザーの削除ができる' do
          visit new_session_path
          fill_in 'session_email', with: 'aa@gmail.com'
          fill_in 'session_password', with: 'aadayo'
          click_button 'Log in'
          visit admin_users_path
          page.accept_confirm do
          page.all(".btn-outline-danger")[1].click
          end
          expect(page).not_to have_content 'qq@gmail.com'
        end
      end
    end
  end
