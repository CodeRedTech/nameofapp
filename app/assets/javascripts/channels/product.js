App.product = App.cable.subscriptions.create("ProductChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },
    
ActionCable.server.broadcast 'product_channel', comment: "Hello World", average_rating: 5

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
      // Called when there's incoming data on the websocket for this channel
      $(".alert.alert-info").show();
  }

});
