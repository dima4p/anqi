url = '<%= card_path  @card %>'
line = $("a[href='#{url}']").closest('tr')
line.fadeOut 1000, ->
  line.remove()
