$( ->
  editor = ace.edit("editor")
  editor.getSession().setMode("ace/mode/html")
  editor.getSession().setMode("ace/mode/liquid")

  setHiddenValue = ->
    $('#template').val( editor.getValue() )
    true
  $('#edit-template-form').submit(setHiddenValue)

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
        $('#code-preview').html(codeBlock)
        $('#html-preview').html(data.sanitizeResult)
      else
        alert(data.msg)
    ).complete( -> btn.disabled = false )
  $('#preview-template-btn').click( handlePreview )

  true
)
