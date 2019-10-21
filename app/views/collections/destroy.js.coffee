url = '<%= collection_path  @collection %>'
line = $("a[href='#{url}']").closest('tr')
line.fadeOut 1000, ->
  line.remove()
