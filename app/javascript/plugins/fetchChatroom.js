import consumer from "../channels/consumer";
import { closeChat } from "./closeChatroom";
import Rails from '@rails/ujs';

const actions = document.querySelectorAll('.chat-action');


const fetchChatroom = () => {
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
            },
          });
          closeChat();
          },
        error: function(data) {}
      })
      
      //fetch(`http://www.jamz.club/chatrooms/${action.dataset.id}`, { mode: 'no-cors'} )
      // .then((response) => {
      //   return response.text()
      //})
      //.then(function(html) {
      //  let html_doc = apiParse(html)
      //});
      
    });
  }));
};

export { fetchChatroom }