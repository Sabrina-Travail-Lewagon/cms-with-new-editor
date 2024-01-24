// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "@popperjs/core"
import "bootstrap"
//= require tinymce
tinymce.init({
  selector: 'tinymce',  // change this value according to your HTML
  file_picker_types: 'file image media'
});
