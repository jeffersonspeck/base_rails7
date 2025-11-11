# Pin npm packages by running ./bin/importmap
pin "application"
pin "@rails/ujs", to: "https://ga.jspm.io/npm:@rails/ujs@7.0.1/lib/assets/compiled/rails-ujs.js"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@popperjs/core", to: "popper.js", preload: true
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "jquery", to: "https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"
pin "chart.js/auto", to: "https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.js", preload: true
pin "sb-admin-2", to: "sb-admin-2.js"   # procura em app/javascript
pin "dashboard", to: "dashboard.js"
pin "topbar_badges", to: "topbar_badges.js"
