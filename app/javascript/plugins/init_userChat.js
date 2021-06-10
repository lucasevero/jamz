const initUserChat = () =>{
  const trigger = document.getElementById('chat-trigger');
  if(trigger) {
    const target = document.getElementById('chat-target');

    trigger.addEventListener('click', (event) => {
      target.classList.toggle('d-none');
    });
  };
};

export { initUserChat }