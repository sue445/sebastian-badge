RSpec.describe Concerns::PluginModules::UpdateCenter do
  describe "#fetch_update_center_plugins" do
    subject { Plugin.fetch_update_center_plugins }

    include_context :with_update_center_stub

    its(:count) { should eq stub_plugin_count }
    it { should be_an_instance_of Hash }
    it { should be_has_key "chatwork" }
  end

  describe "#build_from_update_center" do
    subject { Plugin.build_from_update_center(args) }

    let(:args) {
      {
        "buildDate" => "Jan 22, 2015",
        "dependencies" => [],
        "developers" => [
          {
            "developerId" => "sue445",
            "email" => "sue445@sue445.net",
            "name" => "sue445",
          },
        ],
        "excerpt" => "This Plugin will notify the ChatWork any message. ",
        "gav" => "org.jenkins-ci.plugins:chatwork:0.6.2",
        "labels" => [],
        "name" => "chatwork",
        "previousTimestamp" => "2015-01-14T06:22:42.00Z",
        "previousVersion" => "0.6.1",
        "releaseTimestamp" => "2015-01-22T13:41:30.00Z",
        "requiredCore" => "1.509.3",
        "scm" => "github.com",
        "sha1" => "NgAAMAdJisYMkREAn3oc3hd0lYU=",
        "title" => "ChatWork Plugin",
        "url" => "http://updates.jenkins-ci.org/download/plugins/chatwork/0.6.2/chatwork.hpi",
        "version" => "0.6.2",
        "wiki" => "https://wiki.jenkins-ci.org/display/JENKINS/ChatWork+Plugin",
      }
    }

    its(:name)        { should eq args["name"] }
    its(:title)       { should eq args["title"] }
    its(:version)     { should eq args["version"] }
    its(:wiki_url)    { should eq args["wiki"] }
    its(:released_at) { should eq to_time(args["releaseTimestamp"]) }
  end

  describe "#import_from_update_center" do
    subject { Plugin.import_from_update_center }

    include_context :with_update_center_stub

    context "When no data" do
      it { expect { subject }.to change { Plugin.count }.by stub_plugin_count }
      its(:count) { should eq stub_plugin_count }
    end

    context "When already exists plugins" do
      before do
        Plugin.import_from_update_center

        second_fetched_plugins = Plugin.all

        @updated_plugin = second_fetched_plugins.first
        @updated_plugin.released_at = 1.month.from_now
        second_fetched_plugins[0] = @updated_plugin

        @new_plugin = build(:plugin, released_at: 1.month.from_now)

        second_fetched_plugins << @new_plugin

        allow(Plugin).to receive(:fetched_plugins) { second_fetched_plugins }
      end

      it { expect { subject }.to change { Plugin.count }.by 1 }
      it { should contain_exactly(@updated_plugin, @new_plugin) }
      its(:count) { should eq 2 }
    end
  end
end
