require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe "GET #home" do
    subject { get :home}
    it "returns the correct html" do
      expect(response).to have_http_status(:success)
      expect(subject).to render_template(:home)
    end
  end

  describe "GET #help" do
    subject { get :help}
    it "returns the correct html" do
      expect(response).to have_http_status(:success)
      expect(subject).to render_template(:help)
    end
  end

end
