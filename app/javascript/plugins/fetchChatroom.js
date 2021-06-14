import consumer from "../channels/consumer";
import { closeChat } from "./closeChatroom";

const target = document.getElementById('chat-target');
const actions = document.querySelectorAll('#chat-action');
const current_user_id = document.getElementById('current-user-id').innerText
const chatDiv = document.querySelectorAll('.user-chat')

const fetchChatroom = () => {
  actions.forEach((action => {
    action.addEventListener('click', (event) => {
    
      const newTarget = document.getElementById(`chatroom-${action.dataset.id}`)
      newTarget.style.display = 'block'
      
      fetch(`http://localhost:3000/chatrooms/${action.dataset.id}`, { mode: 'no-cors'} )
       .then((response) => {
         return response.text()
      })
      .then(function(html) {

        var parser = new DOMParser();
  

        var doc = parser.parseFromString(html, "text/html");
  

        var docChatroom = doc.getElementById('chatroom');

        newTarget.insertAdjacentHTML('beforeend', `<div class='opened-chatroom'>${docChatroom.innerHTML}</div>`)

          const id = newTarget.dataset.chatroomId;
          const formMessage = document.getElementById('message_content')
  
        consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
          received(data) {
            formMessage.insertAdjacentHTML("beforebegin", data);
          },
        });
        
        closeChat();
      });
      
    });
  }));
};

export { fetchChatroom }