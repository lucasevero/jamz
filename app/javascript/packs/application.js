// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import 'jquery';
import 'aos/dist/aos.css';
window.$ = $;


// Internal imports

import { initNavbar } from '../plugins/init_navbar';

import { initChatroomCable } from '../channels/chatroom_channel'

import { initMapbox } from '../plugins/init_mapbox';

import { initProfileNav } from '../plugins/profile_nav_item';

import { initAutocomplete } from '../plugins/init_autocomplete';

import { initGifBox } from '../plugins/init_gifbox';

import { initEmojiPicker } from '../plugins/init_emoji_picker';

import AOS from 'aos';

import { fetchChatroom } from '../chat/fetch_chatroom';

import { newChat } from '../chat/create_chat';

import { displayPreview } from '../plugins/displayPreview';

import { openChat } from '../chat/open_chat'

import { previewUserPhoto } from "../plugins/preview_user_photo";

import { submittingPost } from "../plugins/submitting_post";


document.addEventListener('turbolinks:load', () => {

  initNavbar();

  initChatroomCable();

  initMapbox();

  initProfileNav();

  initAutocomplete();

  initEmojiPicker();

  fetchChatroom();

  newChat();

  openChat();

  AOS.init();

  initGifBox();

  previewUserPhoto();

  displayPreview();

  submittingPost();

});
