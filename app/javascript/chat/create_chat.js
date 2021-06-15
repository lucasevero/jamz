import Rails from '@rails/ujs';
import { fetchChatroom } from './fetch_chatroom';

const newChat = () => {
  //  console.log(createChat.dataset.id)
  const createChat = document.querySelectorAll("a[data-id]")[0]
  if(createChat){
    createChat.addEventListener('click', (event) => {
      event.preventDefault();
      // console.log(document.getElementsByName("csrf-token"))
      // console.log(document.getElementsByName("csrf-token")[0].content)
      Rails.ajax({
        url: "/chatrooms",
        type: "post",
        data: `user_id=${createChat.dataset.id}`,
        success: function(data) {
          fetchChatroom()
          // Se quiser abrir tem que achar e clicar no javascript
        },
        error: function(data) {}
      })
    })
  }
}

export { newChat }
