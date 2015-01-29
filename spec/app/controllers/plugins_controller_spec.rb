RSpec.describe "/plugins" do
  describe "GET /plugins/:name" do
    subject! { get "/plugins/#{name}" }

    let(:name)  { plugin.name }
    let(:plugin) { create(:plugin) }

    it { expect(last_response).to be_ok }
    it { expect(assigns(:plugin)).to eq plugin }
  end

  pending "add some examples to #{__FILE__}" do
    before do
      get "/plugins"
    end

    it "returns hello world" do
      expect(last_response.body).to eq "Hello World"
    end
  end
end
