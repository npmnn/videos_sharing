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
    console.log(`Received: ${data}`)

    // // Called when there's incoming data on the websocket for this channel
    // const notification = data.notification;
    // // Update UI to display the new notification
    // const notificationsContainer = document.getElementById("notifications-container");
    // const notificationElement = document.createElement("ul");
    // notificationElement.innerHTML = `
    //   <li style="display: flex; align-items: center;">
    //     <span>${notification.content}</span>
    //     <form action="/notifications/${notification.id}" method="post">
    //       <input type="hidden" name="_method" value="patch">
    //       <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">
    //       <button type="submit" class="mark-as-viewed">x</button>
    //     </form>
    //   </li>`;
    // notificationsContainer.appendChild(notificationElement);
  }
});
