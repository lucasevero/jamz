import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const banner = document.querySelector('.banner')
  if (banner) {
    new Typed('#banner-typed-text', {
      strings: ["beat", "rhythm", "community"],
      typeSpeed: 75,
      loop: true
    });
  }
}

export { loadDynamicBannerText };
