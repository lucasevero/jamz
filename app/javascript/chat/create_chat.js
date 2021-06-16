import Rails from '@rails/ujs';
import { fetchChatroom } from './fetch_chatroom';
import { openChat } from './open_chat';

const newChat = () => {
  const button = document.querySelector('.btn-msg')
  // console.log(button.dataset.id)
  // const button = document.querySelectorAll("a[data-id]")[0]
  if(button){
    button.addEventListener('click', (event) => {
      event.preventDefault();
      // console.log(document.getElementsByName("csrf-token"))
      // console.log(document.getElementsByName("csrf-token")[0].content)
      Rails.ajax({
        url: "/chatrooms",
        type: "post",
        data: `user_id=${button.dataset.id}`,
        success: function(data) {
          button.classList.toggle('btn-open-chat')
          button.classList.toggle('btn-msg')
          delete button.dataset.remote
          console.log(button.dataset.remote)
          openChat();
          fetchChatroom()
          // Se quiser abrir tem que achar e clicar no javascript
        },
        error: function(data) {}
      })
    })
  }
}

export { newChat }
