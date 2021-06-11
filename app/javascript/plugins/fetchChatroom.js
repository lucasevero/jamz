const target = document.getElementById('chat-target');
const actions = document.querySelectorAll('#chat-action');
const current_user_id = document.getElementById('current-user-id').innerText

const fetchChatroom = () => {
  actions.forEach((action => {
    action.addEventListener('click', (event) => {
      console.log(event.currentTarget)
      console.log(action.dataset.id)
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
        target.innerHTML = "";
        target.innerHTML = docChatroom.innerHTML
      });
    });
  }));
};

export { fetchChatroom }