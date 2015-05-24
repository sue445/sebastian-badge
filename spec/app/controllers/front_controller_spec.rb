RSpec.describe "/front" do
  describe "GET /" do
    subject! { get "/" }

    it { expect(last_response).to be_ok }
  end
end
