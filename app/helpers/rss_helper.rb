require 'feedzirra'

module RssHelper
    def get_feed(url)
      feed = Feedzirra::Feed.fetch_and_parse(url)
    end
end