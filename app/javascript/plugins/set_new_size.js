const setNewSize = () => {
  const videoPlayers = document.querySelectorAll('video-post')
  if(videoPlayers != null) {
    videoPlayers.forEach((videoPlayer) => {
      videoPlayer.addEventListener('change', (event) => {
        console.log('hi')
        videoPlayer.width = 524;
      })
    })
  }
};

export { setNewSize }