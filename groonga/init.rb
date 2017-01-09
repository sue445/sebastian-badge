require "bundler"

Bundler.with_clean_env do
  result = system "bundle exec rake groonga:setup"
  raise "Failed: rake groonga:setup" unless result
end
