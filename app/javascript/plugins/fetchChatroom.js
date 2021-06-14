import consumer from "../channels/consumer";

const target = document.getElementById('chat-target');
const actions = document.querySelectorAll('#chat-action');
const current_user_id = document.getElementById('current-user-id').innerText

const fetchChatroom = () => {
  actions.forEach((action => {
    action.addEventListener('click', (event) => {
      // console.log(event.currentTarget) ||  Div which event happened
      // console.log(action.dataset.id) ||  id of the chatroom which event happened
      console.log(action)
      const newTarget = document.getElementById(`chatroom-${action.dataset.id}`)
      console.log(newTarget)
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
        newTarget.innerHTML = "";
        newTarget.innerHTML = docChatroom.innerHTML
        // a ideia a subscribe AQUI para a broadcast chegar
        //achar message container e a variavel ID pq nao vem igual
          const id = newTarget.dataset.chatroomId;
          const formMessage = document.getElementById('message_content')
  
        consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
          received(data) {
            formMessage.insertAdjacentHTML("beforebegin", data);
            formMessage.innerText = ""
          },
        });
      });
    });
  }));
};

export { fetchChatroom }