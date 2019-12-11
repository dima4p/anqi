url = '<%= deck_path  @deck %>'
line = $("a[href='#{url}']").closest('tr')
line.fadeOut 1000, ->
  line.remove()
