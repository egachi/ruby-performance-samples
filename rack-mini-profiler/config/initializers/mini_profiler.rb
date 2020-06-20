

# FileStore is by default and will write to tmp/miniprofiler/*

# set MemoryStore
# Rack::MiniProfiler.config.storage = Rack::MiniProfiler::MemoryStore

# set RedisStore
# if Rails.env.production?
#    Rack::MiniProfiler.config.storage_options = { url: ENV["REDIS_SERVER_URL"] }
#    Rack::MiniProfiler.config.storage = Rack::MiniProfiler::RedisStore
# end

# Memory profiler is disabled by default in production, you can enable using this:
# For more configuration options: https://github.com/MiniProfiler/rack-mini-profiler#configuration-options
if Rails.env.production?
    Rack::MiniProfiler.config.enable_advanced_debugging_tools = true
end
