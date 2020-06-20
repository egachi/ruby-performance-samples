# FileStore is by default and will write to tmp/miniprofiler/*

# set MemoryStore
# Rack::MiniProfiler.config.storage = Rack::MiniProfiler::MemoryStore

# set RedisStore
# if Rails.env.production?
#    Rack::MiniProfiler.config.storage_options = { url: ENV["REDIS_SERVER_URL"] }
#    Rack::MiniProfiler.config.storage = Rack::MiniProfiler::RedisStore
# end