const submittingPost = () => {

  // const postButton = document.getElementById('post-submit')
  // postButton.addEventListener('click', (event) => {
  //   postButton.value = "Test"
  //   
  // })
  const post = document.querySelector('#new_post');
  post.addEventListener('submit', (event) => {
    event.preventDefault();
    document.querySelector('body').style.cursor = "wait"
    const newPostContainer = document.querySelector('.post--container')
    console.log(newPostContainer)
    newPostContainer.innerHTML = ""
    newPostContainer.innerHTML = "<img src='http://res.cloudinary.com/rent-an-instrument/image/upload/v1623880328/pebtsyvvxdpltxof18ja.png' alt='Submitting post' style='display: block; margin: 0 auto;' width='126px' height='126px'><br><p class='text-center'>We are processing your post</p>"
  })
}

export { submittingPost }