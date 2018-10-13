require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  describe "GET root" do
    subject { get :root_url}
    it "renders the :index template" do
      expect(get: root_url(subdomain: nil)).to route_to(controller: "static_pages", action: "home")
    end
  end

  describe "GET #home" do
    subject { get :home}
    it "returns the correct html" do
      expect(response).to have_http_status(:success)
      expect(subject).to render_template(:home)
      # TODO: figure out why tests are not valid
      # subject { should have_title("Home | #{base_title}") }
      # subject { should have_link('Contact', href: contact_path)}
      # subject { should have_link('Home', href: home_path)}
      # subject { should have_link('Help', href: help_path)}
      # subject { should have_link('About', href: about_path)}
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

  describe "GET #contact" do
    subject { get :contact}
    it "returns the correct html" do
      expect(response).to have_http_status(:success)
      expect(subject).to render_template(:contact)
      subject { should have_title("Contact | #{base_title}") }
    end
  end

end
