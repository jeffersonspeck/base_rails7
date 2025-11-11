// app/javascript/sb-admin-2.js

function initSbAdmin() {
  // Garante jQuery disponível
  if (!window.$) return;
  const $ = window.$;

  // Garante plugin do Bootstrap carregado
  if (!$.fn || !$.fn.collapse) return;

  // Fallback para easing se o plugin jquery-easing não estiver presente
  if (!$.easing || !$.easing.easeInOutExpo) {
    $.easing = $.easing || {};
    $.easing.easeInOutExpo = function (x, t, b, c, d) {
      if (t === 0) return b;
      if (t === d) return b + c;
      if ((t /= d / 2) < 1) return c / 2 * Math.pow(2, 10 * (t - 1)) + b;
      return c / 2 * (-Math.pow(2, -10 * --t) + 2) + b;
    };
  }

  // Evita duplicar binds quando Turbo navega
  $('#sidebarToggle, #sidebarToggleTop').off('.sbadmin');
  $(window).off('.sbadmin');
  $('body.fixed-nav .sidebar').off('.sbadmin');
  $(document).off('.sbadmin');

  // Toggle da sidebar
  $('#sidebarToggle, #sidebarToggleTop').on('click.sbadmin', function (e) {
    $('body').toggleClass('sidebar-toggled');
    $('.sidebar').toggleClass('toggled');
    if ($('.sidebar').hasClass('toggled')) {
      $('.sidebar .collapse').collapse('hide');
    }
  });

  $('a.nav-link[data-toggle="collapse"]').off('click.sb-coll').on('click.sb-coll', function (e) {
    e.preventDefault();
    e.stopPropagation();
    const target = $(this).attr('data-target') || $(this).attr('href');
    if (target && target.startsWith('#') && $.fn.collapse) {
      $(target).collapse('toggle');
    }
  });  

  document.addEventListener("turbo:load", () => {
    $('a.nav-link.dropdown-toggle[data-toggle="dropdown"]').off('click.forceDD')
      .on('click.forceDD', function (e) {
        e.preventDefault();
        e.stopPropagation();
        if ($.fn.dropdown) $(this).dropdown('toggle');
      });
  });  

  // Fecha menus quando < 768px e força toggle quando < 480px
  const onResize = function () {
    const w = $(window).width();
    if (w < 768) {
      $('.sidebar .collapse').collapse('hide');
    }
    if (w < 480 && !$('.sidebar').hasClass('toggled')) {
      $('body').addClass('sidebar-toggled');
      $('.sidebar').addClass('toggled');
      $('.sidebar .collapse').collapse('hide');
    }
  };

  // Debounce simples para resize
  let resizeTimer = null;
  $(window).on('resize.sbadmin', function () {
    clearTimeout(resizeTimer);
    resizeTimer = setTimeout(onResize, 100);
  });

  // Evita scroll do conteúdo quando hover na sidebar fixa (largura > 768)
  $('body.fixed-nav .sidebar').on('mousewheel.sbadmin DOMMouseScroll.sbadmin wheel.sbadmin', function (e) {
    if ($(window).width() > 768) {
      const e0 = e.originalEvent;
      const delta = e0.wheelDelta || -e0.detail;
      this.scrollTop += (delta < 0 ? 1 : -1) * 30;
      e.preventDefault();
    }
  });

  // Botão "scroll-to-top" aparece ao rolar
  $(document).on('scroll.sbadmin', function () {
    const sd = $(this).scrollTop();
    if (sd > 100) {
      $('.scroll-to-top').fadeIn();
    } else {
      $('.scroll-to-top').fadeOut();
    }
  });

  // Smooth scroll do botão "scroll-to-top"
  $(document).on('click.sbadmin', 'a.scroll-to-top', function (e) {
    const $anchor = $(this);
    const target = $($anchor.attr('href'));
    if (target.length) {
      $('html, body').stop().animate(
        { scrollTop: target.offset().top },
        1000,
        'easeInOutExpo'
      );
      e.preventDefault();
    }
  });

  // Execução inicial de regras dependentes do viewport
  onResize();
}

// Roda ao carregar a página e após navegações Turbo
document.addEventListener('turbo:load', initSbAdmin);
document.addEventListener('DOMContentLoaded', initSbAdmin);
