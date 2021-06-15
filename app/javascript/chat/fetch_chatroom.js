import { closeChat } from "./close_chatroom";
import { cleanInputMessage } from "./cleanInput";
import { styleMessage } from "./style_message";

import consumer from "../channels/consumer";
import Rails from '@rails/ujs';




const fetchChatroom = () => {
  const actions = document.querySelectorAll('.chat-action');
  actions.forEach((action => {
    action.addEventListener('click', (event) => {
      const newTarget = document.getElementById(`chatroom-${action.dataset.id}`)
      newTarget.style.display = 'block'
      Rails.ajax({
        url: `/chatrooms/${action.dataset.id}`,
        type: "get",
        data: "",
        success: function(data) {
          let html_doc = data.getElementById('chatroom');
          newTarget.insertAdjacentHTML('beforeend', `<div class='opened-chatroom'>${html_doc.innerHTML}</div>`)
          const id = newTarget.dataset.chatroomId;
          const formMessage = document.getElementById('messages')
          consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
            received(data) {
              formMessage.insertAdjacentHTML("beforeend", data);
              styleMessage();
            },
          });
          cleanInputMessage();
          closeChat();
          },
        error: function(data) {}
      })
    });
  }));
};

export { fetchChatroom }