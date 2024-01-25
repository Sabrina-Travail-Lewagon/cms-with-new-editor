// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "@popperjs/core"
import "bootstrap"
//= require tinymce
tinymce.init({
  selector: '.tinymce',  // change this value according to your HTML
  file_picker_types: 'file image media',
  document_base_url: '/',  // Base URL de votre application
  relative_urls: false,  // Empêche TinyMCE de convertir les URLs en URLs relatives
  remove_script_host: false,  // Empêche TinyMCE de supprimer le host des URLs
  // ... autres options ...
});
