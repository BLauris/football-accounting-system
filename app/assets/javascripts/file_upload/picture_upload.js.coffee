createUploader = ->
  params =
    authenticity_token: $("meta[name='csrf-token']").attr("content")
    multipart: true
  
  params.assetable_id = $("#file-uploader").data("assetable-id") if $("#file-uploader").data("assetable-id")
  params.assetable_type = $("#file-uploader").data("assetable-type") if $("#file-uploader").data("assetable-type")
  params.first_page_image = true if $("#file-uploader").data("first-page-images")
  uploader = new qq.FileUploader(
    element: document.getElementById("file-uploader")
    action: $("#file-uploader").data("upload-url")
    debug: true
    params: params
    onComplete: (id, fileName, data) ->
      $(".files").append data unless data == '{"succsess":false}'
  )

$(window).load ->
  createUploader()

$ ->
  $(".close").live "click", ->
    $.ajax
      type: "POST"
      url: @href
      data:
        _method: "delete"
        authenticity_token: $("meta[name='csrf-token']").attr("content")

    $(this).parent().remove()
    false
