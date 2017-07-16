RSpec.describe "/front" do # rubocop:disable RSpec/DescribeClass
  describe "GET /" do
    subject! { get "/" }

    it { expect(last_response).to be_ok }
  end
end
