$( ->
  editor = ace.edit("editor")
  editor.getSession().setMode("ace/mode/html")
  editor.getSession().setMode("ace/mode/liquid")

  setHiddenValue = ->
    $('#template').val( editor.getValue() )
    true
  $('#edit-template-form').submit(setHiddenValue)

  #预览
  handlePreview = (e) ->
    return false if this.disabled
    this.disabled = true

    btn = this
    jBtn = $(this)
    previewUrl = jBtn.data('preview-url')
    $.post( previewUrl, {template: editor.getValue(), t: $('#t').val()}, (data) ->
      if data.ok
        codeBlock = $('<pre></pre>')
        codeBlock.append(data.escapeResult)
        $('#code-preview div').html(codeBlock)
        $('#html-preview div').html(data.sanitizeResult)
        $('#code-preview').show()
        $('#html-preview').show()
        $('#preview-msg').hide()
      else
        $('#preview-msg').text(data.msg)
        $('#code-preview').hide()
        $('#html-preview').hide()
        $('#preview-msg').show()
    ).complete( ->
      btn.disabled = false
      $('div.preview-area').show()
    )
  $('#preview-template-btn').click( handlePreview )

  true
)
