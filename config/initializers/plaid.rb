require 'plaid'
$client = Plaid::Client.new(env: :sandbox,
                            client_id: ENV['plaid_client_id'],
                            secret: ENV['plaid_secret'],
                            public_key: ENV['plaid_key'])