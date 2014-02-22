CarrierWave.configure do |c|
  c.storage = :file
  c.asset_host = ActionController::Base.asset_host
end