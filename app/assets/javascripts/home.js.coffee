change_time = ->
    date = Date.parse "<%= Date.today %>"
    d = $("#time_delimiter")
    h = $("#hour")
    m = $("#minute")
    d.toggleClass("white-delimiter")
    m.html
change_minutes = ->
    m = $("#minute")
    minutes = parseInt(m.html(),10) + 1
    if minutes >= 60
        minutes = "00"
    if 0 < minutes and minutes < 10
        minutes = "0#{minutes}" 
    m.html(minutes)
    
jQuery ->
    setInterval change_time, 1000
    setInterval change_minutes, 60000