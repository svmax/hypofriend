require 'bundler/setup'
require 'hypofriend'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.configure_rspec_metadata!
  config.hook_into :webmock
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.around(:each) do |example|
    if example.metadata[:type] == :feature
      WebMock.allow_net_connect!
      VCR.turned_off { example.run }
      WebMock.disable_net_connect!
    else
      example.run
    end
  end
end
