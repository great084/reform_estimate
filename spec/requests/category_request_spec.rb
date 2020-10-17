require 'rails_helper'

RSpec.describe "Categories", type: :request do

  context "as an authenticated user" do
    before do
      @user = User.create(nickname: "hoge", email:"test@example.com", password: "password")
      sign_in @user
      @category1 = Category.create(category_name: "1塗装", user_id: @user.id)
      Category.create(category_name: "2外壁", user_id: @user.id)
    end

    describe "#index" do
      it "responds successfully" do
        # sign_in @user
        get categories_path
        expect(response).to be_successful
        # expect(response).to be_success
        expect(response).to have_http_status "200"
      end
    end

    describe "#create" do
      it "responds successfully with valid data" do
        # sign_in @user
        post categories_path, params: { category: { category_name: "3内装" } }
        # expect(response).to be_successful
        expect(response).to have_http_status "302"
        expect(response).to redirect_to categories_path
      end

      it "added category count 1" do
        # sign_in @user
        expect{ 
          post categories_path, params: { category: { category_name: "3内装" } }
        }.to change(@user.categories, :count).by(1)  
      end
    end
  end

  context "as no authenticated user" do
    describe "#index" do
      it "redirect to user sign_in path" do
        get categories_path
        expect(response).to redirect_to new_user_session_path
        expect(response).to have_http_status "302"
        # expect(response).to render_template(new_user_session_path)
      end
    end
  end

end
