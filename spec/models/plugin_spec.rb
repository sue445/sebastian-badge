RSpec.describe Plugin do
  describe "#get_update_center_plugins" do
    subject{ Plugin.get_update_center_plugins }

    include_context :with_update_center_stub

    its(:count) { should eq 1053 }
    it { should be_an_instance_of Hash  }
    it { should be_has_key "chatwork" }
  end
end
