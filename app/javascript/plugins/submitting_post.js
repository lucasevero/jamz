const submittingPost = () => {

  // const postButton = document.getElementById('post-submit')
  // postButton.addEventListener('click', (event) => {
  //   postButton.value = "Test"
  //   
  // })

  const post = document.querySelector('#new_post');
  post.addEventListener('submit', (event) => {
    event.preventDefault();
    console.log("submitting..");
    const buttonText = document.getElementById('post-submit')
    document.querySelector('body').style.cursor = "wait"
  })
}

export { submittingPost }