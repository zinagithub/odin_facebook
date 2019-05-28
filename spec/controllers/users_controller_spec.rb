require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	let(:user) { create :user }
	context "when the user is an logged in" do
		login_user
	    it "assigns @users" do
	      get :index
	      expect(assigns(:users)).to include(user)
	    end

	    it "renders the index template" do
	      get :index
	      expect(response).to render_template("index")
	    end

	    it "renders the show template" do
	      get :show, params: { id: user.id }
	      expect(response).to render_template("show")
	    end
	end
	context "when the user is not logged in" do
	    it "redirects from index page to login_page" do
	      get :index
	      expect redirect_to new_user_session_path
	    end

	    it "redirects from index page to login_page" do
	      get :index, params: { id: user.id }
	      expect redirect_to new_user_session_path
	    end
	end
end
