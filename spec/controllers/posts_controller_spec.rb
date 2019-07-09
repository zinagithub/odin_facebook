require 'rails_helper'

RSpec.describe PostsController, type: :controller do

	let(:post) { create :post }
	context "Assignement" do
		login_user
	    it "should assigns posts" do
	      get :index
	      expect(assigns(:posts)).to include(post)
	    end
	end

	context "Templates" do
		login_user
	    it "should renders the index template" do
	      get :index
	      expect(response).to render_template("index")
	    end
	    it "should renders the new template" do
	      get :new
	      expect(response).to render_template("new")
	    end
	end

	context "Redirection" do
	    it "redirects from index page to login_page" do
	      get :index
	      expect redirect_to new_user_session_path
	    end
	end
	
end


