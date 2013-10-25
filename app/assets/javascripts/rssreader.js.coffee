RssReaderModule = ->
    init = (FEED_URL) ->
          console.log("Initialize rss reader module")
          $.get FEED_URL, (feed) ->
              console.log feed.title
          return
    init: init
    
root = exports ? this
root.RssReaderModule = RssReaderModule()