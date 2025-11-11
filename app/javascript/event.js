  document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll("[id^=toggle-publish-btn-]").forEach(button => {
      button.addEventListener("click", function () {
        const eventId = this.dataset.eventId;
        const companyId = this.dataset.companyId;
        const isPublished = this.dataset.published === "true";

        // Pergunta ao usuário antes de executar a ação
        const confirmMessage = isPublished 
          ? "Tem certeza que deseja despublicar este evento?" 
          : "Tem certeza que deseja publicar este evento?";
        
        if (!window.confirm(confirmMessage)) {
          return; // Cancela a ação se o usuário clicar em "Cancelar"
        }

        fetch(`/companies/${companyId}/events/${eventId}/toggle_publish`, {
          method: "PATCH",
          headers: {
            "Content-Type": "application/json",
            "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content
          }
        })
        .then(response => response.json())
        .then(data => {
          if (data.success) {
            // Alterna as classes do botão
            this.classList.toggle("btn-success", data.published);
            this.classList.toggle("btn-danger", !data.published);

            this.title = data.published 
              ? "Clique para despublicar este evento" 
              : "Clique para publicar este evento";        
            
            // Atualiza o atributo data-published
            this.dataset.published = data.published;

            // Alterna o ícone dentro do botão
            const icon = this.querySelector("i");
            if (icon) {
              icon.classList.toggle("fa-book-open", data.published);
              icon.classList.toggle("fa-book", !data.published);
            }
          } else {
            alert(data.error);
          }
        })
        .catch(error => console.error("Erro:", error));
      });
    });

    document.querySelectorAll("[id^=toggle-finished-btn-]").forEach(button => {
      button.addEventListener("click", function () {
        const eventId = this.dataset.eventId;
        const companyId = this.dataset.companyId;
        const isFinished = this.dataset.finished === "true";

        // Pergunta ao usuário antes de executar a ação
        const confirmMessage = isFinished 
          ? "Tem certeza que deseja reabrir este evento?" 
          : "Tem certeza que deseja finalizar este evento?";
        
        if (!window.confirm(confirmMessage)) {
          return; // Cancela a ação se o usuário clicar em "Cancelar"
        }

        fetch(`/companies/${companyId}/events/${eventId}/toggle_finish`, {
          method: "PATCH",
          headers: {
            "Content-Type": "application/json",
            "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content
          }
        })
        .then(response => response.json())
        .then(data => {
          if (data.success) {
            // Alterna as classes do botão
            this.classList.toggle("btn-success", data.finished);
            this.classList.toggle("btn-danger", !data.finished);

            this.title = data.finished 
              ? "Clique para reabrir este evento" 
              : "Clique para finalizar este evento";        
            
            // Atualiza o atributo data-finished
            this.dataset.finished = data.finished;

            // Alterna o ícone dentro do botão
            const icon = this.querySelector("i");
            if (icon) {
              icon.classList.toggle("fa-check", data.finished);
              icon.classList.toggle("fa-xmark", !data.finished);
            }
          } else {
            alert(data.error);
          }
        })
        .catch(error => console.error("Erro:", error));
      });
    });

  });
