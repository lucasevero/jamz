import { closeChat } from "./closeChatroom";
import { cleanInputMessage } from "./cleanInput";

import consumer from "../channels/consumer";
import Rails from '@rails/ujs';


const styleMessage = () => {
  const allMessages = document.querySelectorAll('[data-user-id]');
  const lastMessage = allMessages[allMessages.length - 1]
  const lastMessageAuthorId = lastMessage.dataset.userId;
  const currentUserId = document.getElementById('current-user-id').innerText;

  if(lastMessageAuthorId != currentUserId) {
    console.log(lastMessageAuthorId != currentUserId)
    lastMessage.firstElementChild.classList.add('friend')
    lastMessage.lastElementChild.classList.add('friend') 
    lastMessage.lastElementChild.style.color = '#4C5A5B'
  }
}

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