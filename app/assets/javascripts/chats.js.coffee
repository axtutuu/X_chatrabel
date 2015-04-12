# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class @ChatClass
  constructor: (url, useWebsocket) ->
    # これがソケットのディスパッチャー
    @dispatcher = new WebSocketRails(url, useWebsocket)
    console.log(url)
    # イベントを監視
    @bindEvents()
 
  bindEvents: () =>
    # 送信ボタンが押されたらサーバへメッセージを送信
    $('#send').on 'click', @sendMessage
    # サーバーからnew_messageを受け取ったらreceiveMessageを実行
    @dispatcher.bind 'new_message', @receiveMessage
 
  sendMessage: (event) =>
    # サーバ側にsend_messageのイベントを送信
    # オブジェクトでデータを指定
    msg_body = $('#msgbody').val()
    user_name = $('#user_name').val()
    room_id = $('#room_id').val()
    @dispatcher.trigger 'new_message', { name: user_name, body: msg_body, room_id: room_id}
    $('#msgbody').val('')
 
  receiveMessage: (message) =>
    console.log message
    # 受け取ったデータをappend
    $('#chat').append "#{message.name}「#{message.body}」<br/>"
 
  $ ->
    window.chatClass = new ChatClass($('#chat').data('uri'), true)
