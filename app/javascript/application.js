import Rails from "@rails/ujs"
Rails.start()
console.log("Rails UJS inicializado")

import { Turbo } from "@hotwired/turbo-rails"
Turbo.start()

import "controllers"

// Importa jQuery como efeito colateral (UMD coloca em window)
import "jquery"
window.$ = window.jQuery = window.jQuery || window.$
import "@popperjs/core"
// Agora Bootstrap encontra $.fn
import "bootstrap"

// O resto
import "sb-admin-2"
import "dashboard"
import "topbar_badges"