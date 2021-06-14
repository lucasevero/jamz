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

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

import { initNavbar } from '../plugins/init_navbar';

import { initChatroomCable } from '../channels/chatroom_channel'

import { initMapbox } from '../plugins/init_mapbox';


import { initProfileNav } from '../plugins/profile_nav_item'

import { initAutocomplete } from '../plugins/init_autocomplete';


// Code to add preview when uploading file
const input = document.getElementById('post_photos')
const preview = document.getElementById('previews')


// se quiser improve pode display more

const displayPreview = (input) => {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = (event) => {
      document.getElementById('photo-preview').src = event.currentTarget.result;
    }
    reader.readAsDataURL(input.files[0])
    document.getElementById('photo-preview').classList.remove('hidden');
  }
}

if(input){
  input.addEventListener('change', (event) => {
  displayPreview(input)
  });
};


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();

  initNavbar();

  initChatroomCable();

  initMapbox();

  initProfileNav();

  initAutocomplete();

});

// Function for RESIZE video is INSIDE THE posts/index.html.erb

import "controllers"
