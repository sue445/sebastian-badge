RSpec.describe "/plugins" do
  describe "GET /plugins/:name" do
    subject! { get "/plugins/#{name}" }

    let(:name)  { plugin.name }
    let(:plugin) { create(:plugin) }

    it { expect(last_response).to be_ok }
    it { expect(assigns(:plugin)).to eq plugin }
  end

  describe "GET /plugins" do
    before do
      get "/plugins", params
    end

    context "without query" do
      let(:params) { {} }

      it { expect(last_response).to be_ok }
      it { expect(assigns(:plugins)).to eq [] }
    end

    context "with query" do
      let(:params) { { query: "test" } }

      it { expect(last_response).to be_ok }
      it { expect(assigns(:plugins)).to eq [] }
    end
  end
end
