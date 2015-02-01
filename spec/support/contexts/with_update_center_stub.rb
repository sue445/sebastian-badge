shared_context :with_update_center_stub do
  before do
    fixture_json = fixture("update-center.json")
    stub_request(:get, "https://updates.jenkins-ci.org/current/update-center.json").
      with(headers: { "Accept" => "*/*", "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3", "User-Agent" => "Ruby" }).
      to_return(status: 200, body: fixture_json, headers: {})
  end

  let(:stub_plugin_count) { 150 }
end
