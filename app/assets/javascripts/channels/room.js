MakeMessageChannel = function(room_name) {
	App.room = App.cable.subscriptions.create({
    channel: "ChatChannel",
    room: room_name
  }, {
  	connected: function() {},
    disconnected: function() {},
    received: function(data) {
      	//return $('#messages').append(data['message']);
      	spanElement = document.createElement("span");
      	spanElement.className = "speaker";
      	spanElement.appendChild(document.createTextNode(data["sent_by"]));
      	html = document.createElement("article");
      	html.appendChild(spanElement);

      	spanElement = document.createElement("span");
      	spanElement.className = "body";
	  	spanElement.appendChild(document.createTextNode(data["body"]));
	  	html.appendChild(spanElement);

	  	return $("#messages").append(html)
    },
    speak: function(message, room_name) {
      return this.perform('speak', {
        message: message,
        room: room_name
      });
    }
  });
/*
  $(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
    if (event.keyCode === 13) {
      App.room.speak(event.target.value, room_name);
      event.target.value = "";
      event.preventDefault();
    }
    return $('#messages').animate({
      scrollTop: $('#messages')[0].scrollHeight
    }, 100);
  });
*/
};

$(document).on("ready turbolinks:load", function() {
	var roomname = $("#rname").val();
	if (roomname) {
  		if (App.room) {
      		App.cable.subscriptions.remove(App.room);
    	}
    	MakeMessageChannel(roomname);
	}
});