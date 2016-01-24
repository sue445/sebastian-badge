RSpec.describe Plugin do
  describe "#sha1" do
    subject { plugin.sha1 }

    let(:plugin) do
      create(
        :plugin,
        name:        "chatwork",
        version:     "0.0.4",
        released_at: Time.zone.parse("2015-02-03")
      )
    end

    it { should eq "5c96babf84c4c1b603a04dd7b5e32b75c0d312df" }
  end
end
