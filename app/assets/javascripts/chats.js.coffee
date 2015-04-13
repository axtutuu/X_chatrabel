# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class @ChatClass
  constructor: (url, useWebsocket) ->
    # これがソケットのディスパッチャー
    room_id = $('#room_id').val()
    this.current_user_id = $('#current_user_id').text()
    @dispatcher = new WebSocketRails(url, useWebsocket)
    @channel = @dispatcher.subscribe(room_id)
    console.log(url)
    # イベントを監視
    @bindEvents()

  bindEvents: () =>
    # 送信ボタンが押されたらサーバへメッセージを送信
    $('#send').on 'click', @sendMessage
    # サーバーからnew_messageを受け取ったらreceiveMessageを実行
    @dispatcher.bind 'new_message', @receiveMessage
    @channel.bind 'new_message', @receiveMessage

  sendMessage: (event) =>
    # サーバ側にsend_messageのイベントを送信
    # オブジェクトでデータを指定
    msg_body = $('#msgbody').val()
    user_name = $('#user_name').val()
    room_id = $('#room_id').val()
    user_id = $('#user_id').val()
    @dispatcher.trigger 'new_message', { name: user_name, body: msg_body, room_id: room_id, user_id: user_id}
    $('#msgbody').val('')

  receiveMessage: (message) =>
    console.log message
    # 受け取ったデータをappend
    if message.user_id == this.current_user_id
      $('#chat').append this.meHtml(message)
    else
      $('#chat').append this.otherHtml(message)

  meHtml: (message) ->
    return """
      <div class="box_right" >
          <p><span style="color: blue;">#{message.name}</span></p>
          <div class="arrow_box_right">
            <p class="message">#{message.body}</p>
          </div>
      </div>
      <div class="clear"></div>
    """

  otherHtml: (message) ->
    return """
      <div class="box_left">
          <p><span style="color: blue;">#{message.name}</span></p>
          <div class="arrow_box_left">
            <div class="message">#{message.body}</div>
          </div>
      </div>
      <div class="clear"></div>
    """


  $ ->
    window.chatClass = new ChatClass($('#chat').data('uri'), true)
