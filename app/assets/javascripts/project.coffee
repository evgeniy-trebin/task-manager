$(()->
  $task_list = $('#tasks_list')
  $task_list.on 'click touchstart','.js-task-state-link', ->
    $this = $(this)
    $.ajax(
      url: $this.data('url'),
      type: 'post',
      data:
        _method:'patch'
        id: $this.data('id'),
      dataType: 'json'
    ).success((data, textStatus, jqXHR)->
      if data['result'] == 'success'
        $this.replaceWith(data['html'])
      else
        alert(data['message'])

    ).error((data, textStatus, jqXHR)->
      alert('Error!')
    )
)
