require 'rails_helper'

RSpec.describe "Categories", type: :request do

  context "as an authenticated user" do
    before do
      @user = User.create(nickname: "hoge", email:"test@example.com", password: "password")
      sign_in @user
      @category1 = Category.create(category_name: "1塗装", user_id: @user.id)
      @category2 = Category.create(category_name: "2外壁", user_id: @user.id)
    end

    describe "#index" do
      it "responds successfully" do
        get categories_path
        # binding.pry
        expect(response).to be_successful
        expect(response).to have_http_status "200"
      end
    end

    describe "#create" do
      it "responds successfully with valid data" do
        post categories_path, params: { category: { category_name: "3内装" } }
        expect(response).to have_http_status "302"
        expect(response).to redirect_to categories_path
      end

      it "added category count 1 with valid data" do
        expect{ 
          post categories_path, params: { category: { category_name: "3内装" } }
        }.to change(@user.categories, :count).by(1)  
      end

      it "responds successfully with invalid data" do
        post categories_path, params: { category: { category_name: "1塗装" } }
        # binding.pry
        expect(response).to be_successful
        expect(response).to have_http_status "200"
      end

      it "not increase category data with invalid data" do
        expect{ 
          post categories_path, params: { category: { category_name: "1塗装" } }
        }.to change(@user.categories, :count).by(0)  
      end
    end

    describe "#update" do
      it "responds successfully with valid data" do
        put category_path(@category1), params: { category: {category_name: "3内装" } }
        expect(response).to have_http_status "302"
        expect(response).to redirect_to categories_path
      end

      it "update a category values" do
        put category_path(@category1), params: { category: {category_name: "3内装" } }
        expect(@category1.reload.category_name).to eq "3内装"
      end

      it "responds successfully with invalid data" do
        put category_path(@category1), params: { category: {category_name: @category2.category_name } }
        # binding.pry
        expect(response).to be_successful
        expect(response).to have_http_status "200"
      end

      it "not update a category values with invalid data" do
        # binding.pry
        old_category_name = @category1.category_name
        put category_path(@category1), params: { category: {category_name: @category2.category_name } }
        # expect{ @category1 }.not_to change{ @category1.reload }
        expect(@category1.reload.category_name).to eq old_category_name
      end
    end

    describe "#destroy" do
      it "responds successfully with valid data" do
        delete category_path(@category1)
        expect(response).to have_http_status "302"
        expect(response).to redirect_to categories_path
      end

      it "decrease 1 data when valid data" do
        expect{
          delete category_path(@category1)
        }.to change(@user.categories, :count).by(-1)  
      end

      # 対象のレコードが既に存在しない場合のエラー処理がないので書くべき
      xit "responds successfully with invalid data" do
        @category1.destroy
        delete category_path(@category1)
        # binding.pry
        expect(response).to be_successful
        expect(response).to have_http_status "200"
      end

      it "not update a category values with invalid data" do
        # binding.pry
        old_category_name = @category1.category_name
        put category_path(@category1), params: { category: {category_name: @category2.category_name } }
        # expect{ @category1 }.not_to change{ @category1.reload }
        expect(@category1.reload.category_name).to eq old_category_name
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
