const easterEgg = () => {
  const html_keyboard = "<style>.keys {  display: flex; align-items: center;  justify-content: center;}.key {  border: 1px solid #d31515d4;  border-radius: 4px;  margin: 1rem;  text-align: center;  padding: .5rem .5rem;  transition: all .07s ease;  background-color: rgb(245,245,245);  box-shadow: 1px 1px 10px rgba(0, 0, 0, 0.2);  text-shadow: 0 0 black;}.playing {  transform: scale(1.1);  border-color: #ffc600;  box-shadow: 0 0 1rem #ffc600;}p {  display: block;  font-size: 1rem;}.sound {  font-size: 0.8rem;  text-transform: uppercase;  letter-spacing: .1rem;  color: #ffc600;}</style><div class='container'><div class='row'>  <div class=''>  <h1>Let's Jamz</h1>  <div class='keys'>    <div data-key='65' class='key'>      <p>A</p>      <span class='sound'>Dó(C)</span>    </div>    <div data-key='83' class='key'>      <p>S</p>      <span class='sound'>Ré(D)</span>    </div>    <div data-key='68' class='key'>      <p>D</p>      <span class='sound'>Mi(E)</span>    </div>    <div data-key='70' class='key'>      <p>F</p>      <span class='sound'>Fá(F)</span>    </div>    <div data-key='71' class='key'>      <p>G</p>      <span class='sound'>Sol(G)</span>    </div>    <div data-key='72' class='key'>      <p>H</p>      <span class='sound'>Lá(A)</span>    </div>    <div data-key='74' class='key'>      <p>J</p>      <span class='sound'>Si(B)</span>    </div>    <div data-key='75' class='key'>      <p>K</p>      <span class='sound'>Dó(C)</span>    </div>  </div>  </div></div></div><div class='audios hidden'><audio data-key='65' src='http://res.cloudinary.com/rent-an-instrument/video/upload/v1623891056/do.mp3'></audio><audio data-key='83' src='http://res.cloudinary.com/rent-an-instrument/video/upload/v1623891121/re.mp3'></audio><audio data-key='68' src='http://res.cloudinary.com/rent-an-instrument/video/upload/v1623891149/mi.mp3'></audio><audio data-key='70' src='http://res.cloudinary.com/rent-an-instrument/video/upload/v1623891174/fa.mp3'></audio><audio data-key='71' src='http://res.cloudinary.com/rent-an-instrument/video/upload/v1623891247/sol.mp3'></audio><audio data-key='72' src='http://res.cloudinary.com/rent-an-instrument/video/upload/v1623890986/la.mp3'></audio><audio data-key='74' src='http://res.cloudinary.com/rent-an-instrument/video/upload/v1623891025/si.mp3'></audio><audio data-key='75' src='http://res.cloudinary.com/rent-an-instrument/video/upload/v1623891096/do8a.mp3'></audio></div>"

  const banner = document.querySelector('.banner')
  let timesPressed = 0
  const start = new Date().getSeconds();
  const startMinute = new Date().getMinutes();
  if(banner){
    banner.addEventListener('click', (event) => {
      timesPressed++
      if((timesPressed == 3) && ( new Date().getSeconds() - start <= 30) && (new Date().getMinutes() == startMinute)){
        console.log( new Date().getSeconds() - start )
        console.log(new Date().getMinutes() == startMinute)
        banner.innerHTML = ""
        banner.innerHTML = html_keyboard
        function removeTransition(event) {
          if (event.propertyName !== 'transform') return;
          event.target.classList.remove('playing');
        }
        function playSound(event) {
          const audio = document.querySelector(`audio[data-key='${event.keyCode}']`);
          const key = document.querySelector(`div[data-key='${event.keyCode}']`);
          if (!audio) return;  key.classList.add('playing');
          audio.currentTime = 0;
          audio.play();
        }
        const keys = document.querySelectorAll('.key');
        keys.forEach((key) => {
          key.addEventListener('transitionend', removeTransition)
        });
        window.addEventListener('keydown', playSound);
      }
    })
  }
}

export { easterEgg }