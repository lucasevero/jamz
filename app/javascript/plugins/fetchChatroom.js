import consumer from "../channels/consumer";
import { closeChat } from "./closeChatroom";

const target = document.getElementById('chat-target');
const actions = document.querySelectorAll('#chat-action');
const current_user_id = document.getElementById('current-user-id').innerText
const chatDiv = document.querySelectorAll('.user-chat')

const fetchChatroom = () => {
  actions.forEach((action => {
    action.addEventListener('click', (event) => {
    
      // console.log(event.currentTarget) ||  Div which event happened
      // console.log(action.dataset.id) ||  id of the chatroom which event happened
      console.log(action)

      const newTarget = document.getElementById(`chatroom-${action.dataset.id}`)
      newTarget.style.display = 'block' // Quando fechar tem que display: flex;
      
      fetch(`http://localhost:3000/chatrooms/${action.dataset.id}`, { mode: 'no-cors'} )
       .then((response) => {
         return response.text()
      })
      .then(function(html) {
        // Initialize the DOM parser
        var parser = new DOMParser();
  
        // Parse the text
        var doc = parser.parseFromString(html, "text/html");
  
        // You can now even select part of that html as you would in the regular DOM 
        // Example:
        var docChatroom = doc.getElementById('chatroom');
        console.log(`<div class='opened-chatroom'>${docChatroom.innerHTML}</div>`)
        // newTarget.innerHTML = "";
        // newTarget.innerHTML = docChatroom.innerHTML
        // inserir nova div com o chat facilita a remocao depois e performance em reload
        newTarget.insertAdjacentHTML('beforeend', `<div class='opened-chatroom'>${docChatroom.innerHTML}</div>`)
        // a ideia a subscribe AQUI para a broadcast chegar
        // achar message container e a variavel ID pq nao vem igual
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