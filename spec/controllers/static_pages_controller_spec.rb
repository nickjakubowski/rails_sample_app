require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  describe "GET #home" do
    subject { get :home}
    it "returns the correct html" do
      expect(response).to have_http_status(:success)
      expect(subject).to render_template(:home)
      subject { should have_title("Home | #{base_title}") }
    end
  end

  describe "GET #help" do
    subject { get :help}
    it "returns the correct html" do
      expect(response).to have_http_status(:success)
      expect(subject).to render_template(:help)
      subject { should have_title("Help | #{base_title}") }
    end
  end

  describe "GET #about" do
    subject { get :about}
    it "returns the correct html" do
      expect(response).to have_http_status(:success)
      expect(subject).to render_template(:about)
      subject { should have_title("About | #{base_title}") }
    end
  end

end
