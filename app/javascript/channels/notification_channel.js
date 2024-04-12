import consumer from "./consumer"

consumer.subscriptions.create("NotificationChannel", {
  connected() {
    console.log("Connected to the channel:", this);
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    console.log("Disconnected");
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(`Received: ${data.message}`);
    alert(`Have New Video: ${data.message}`);
  }
});
