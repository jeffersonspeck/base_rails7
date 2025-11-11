// (function(){
//   let timer;

//   function setBadge(id, n){
//     const el = document.getElementById(id);
//     if (!el) return;
//     if ((n||0) > 0) { el.textContent = n; el.classList.remove('d-none'); }
//     else { el.classList.add('d-none'); }
//   }

//   function esc(s){ const d=document.createElement('div'); d.textContent=s||''; return d.innerHTML; }

//   async function j(url){
//     const r = await fetch(url, { headers: { 'Accept':'application/json' }, credentials:'same-origin' });
//     if(!r.ok) throw new Error(`HTTP ${r.status}`);
//     return r.json();
//   }

//   function renderList(containerId, emptyText, htmlItems){
//     const c = document.getElementById(containerId);
//     if (!c) return;
//     c.innerHTML = (htmlItems && htmlItems.length)
//       ? htmlItems.join('')
//       : `<span class="dropdown-item small text-gray-500">${emptyText}</span>`;
//   }

  // async function tick(){
  //   try{
  //     const [emails, notifs, alerts] = await Promise.all([
  //       j('/internal_emails/unread'),     // { unread_count, messages: [{id,title,from,photo,created_at}] }
  //       j('/notifications/unread').catch(()=>null) // opcional; remova se não tiver
  //     ]);

  //     // Mensagens
  //     setBadge('messages-badge', emails.unread_count||0);
  //     renderList('messages-list', 'Sem mensagens',
  //       (emails.messages||[]).map(m => `
  //         <a class="dropdown-item d-flex align-items-center" href="/internal_emails/${m.id}">
  //           <div class="dropdown-list-image mr-3">
  //             <img class="rounded-circle" src="${esc(m.photo||'/img/undraw_profile.svg')}" alt="Foto">
  //             <div class="status-indicator bg-success"></div>
  //           </div>
  //           <div class="w-100">
  //             <div class="text-truncate d-block" style="max-width:240px;">${esc(m.title)}</div>
  //             <div class="small text-gray-500">${esc(m.from||'Desconhecido')} • ${esc(m.created_at||'')}</div>
  //           </div>
  //         </a>
  //       `)
  //     );

  //     // Notificações
  //     setBadge('notifications-badge', notifs.unread_count||0);
  //     renderList('notifications-list', 'Sem notificações',
  //       (notifs.notifications||[]).map(n => `
  //         <a class="dropdown-item d-flex align-items-center" href="${esc(n.link||'#')}">
  //           <div class="mr-3">
  //             <div class="icon-circle bg-primary">
  //               <i class="fas fa-info text-white"></i>
  //             </div>
  //           </div>
  //           <div class="w-100">
  //             <div class="text-truncate d-block" style="max-width:240px;">${esc(n.text)}</div>
  //             <div class="small text-gray-500">${esc(n.created_at||'')}</div>
  //           </div>
  //         </a>
  //       `)
  //     );

  //     // Alerts (se existir endpoint)
  //     if (alerts){
  //       setBadge('alerts-badge', alerts.count||0);
  //       renderList('alerts-list', 'Sem alertas',
  //         (alerts.issues||[]).map(i => `
  //           <a class="dropdown-item d-flex align-items-center" href="/issues/${i.id}">
  //             <div class="mr-3">
  //               <div class="icon-circle bg-warning">
  //                 <i class="fas fa-exclamation-triangle text-white"></i>
  //               </div>
  //             </div>
  //             <div class="w-100">
  //               <div class="small text-gray-500">&nbsp;&nbsp;${esc(i.created_at||'')}</div>
  //               <span class="font-weight-bold text-truncate d-block" style="max-width:240px;">
  //                 &nbsp;&nbsp;${esc(i.title)}
  //               </span>
  //             </div>
  //           </a>
  //         `)
  //       );
  //     }
  //   }catch(e){ /* silencioso */ }
  // }

  // function start(){ tick(); timer = setInterval(tick, 30000); }
  // function stop(){ if (timer) clearInterval(timer); timer = null; }

//   document.addEventListener('turbo:load', start);
//   document.addEventListener('turbo:before-cache', stop);
//   document.addEventListener('DOMContentLoaded', ()=>{ if(!timer) start(); });
// })();